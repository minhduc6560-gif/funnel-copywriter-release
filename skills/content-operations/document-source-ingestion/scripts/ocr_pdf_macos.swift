import Foundation
import PDFKit
import Vision
import AppKit

let args = CommandLine.arguments
var positional: [String] = []
var languageCodes = ""
var force = false
var index = 1

while index < args.count {
    switch args[index] {
    case "--force":
        force = true
        index += 1
    case "--languages":
        guard index + 1 < args.count else {
            fputs("--languages requires a comma-separated value\n", stderr)
            exit(2)
        }
        languageCodes = args[index + 1]
        index += 2
    default:
        positional.append(args[index])
        index += 1
    }
}

guard positional.count == 2 else {
    fputs("Usage: ocr_pdf_macos.swift input.pdf output.txt [--languages vi-VN,en-US] [--force]\n", stderr)
    exit(2)
}

let input = URL(fileURLWithPath: positional[0])
let output = URL(fileURLWithPath: positional[1])

if FileManager.default.fileExists(atPath: output.path) && !force {
    fputs("Output exists; pass --force to overwrite: \(output.path)\n", stderr)
    exit(2)
}

guard let document = PDFDocument(url: input) else {
    fputs("Cannot open PDF\n", stderr)
    exit(1)
}

let requestedLanguages = languageCodes
    .split(separator: ",")
    .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    .filter { !$0.isEmpty }

var corpus = ""

for pageIndex in 0..<document.pageCount {
    autoreleasepool {
        guard let page = document.page(at: pageIndex) else {
            corpus += "\n\n===== PAGE \(pageIndex + 1) - MISSING PAGE =====\n"
            return
        }

        let bounds = page.bounds(for: .mediaBox)
        let scale: CGFloat = 2.5
        let width = Int(bounds.width * scale)
        let height = Int(bounds.height * scale)

        guard let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
        ) else {
            corpus += "\n\n===== PAGE \(pageIndex + 1) - RENDER ERROR =====\n"
            return
        }

        context.setFillColor(NSColor.white.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        context.saveGState()
        context.scaleBy(x: scale, y: scale)
        page.draw(with: .mediaBox, to: context)
        context.restoreGState()

        guard let image = context.makeImage() else {
            corpus += "\n\n===== PAGE \(pageIndex + 1) - IMAGE ERROR =====\n"
            return
        }

        let request = VNRecognizeTextRequest()
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true

        if !requestedLanguages.isEmpty {
            let supported = (try? request.supportedRecognitionLanguages()) ?? []
            let accepted = requestedLanguages.filter { supported.contains($0) }
            let rejected = requestedLanguages.filter { !supported.contains($0) }
            if !rejected.isEmpty {
                fputs("Ignoring unsupported OCR languages: \(rejected.joined(separator: ","))\n", stderr)
            }
            if !accepted.isEmpty {
                request.recognitionLanguages = accepted
            }
        }

        do {
            try VNImageRequestHandler(cgImage: image, options: [:]).perform([request])
            let observations = (request.results ?? []).sorted {
                let leftY = $0.boundingBox.midY
                let rightY = $1.boundingBox.midY
                if abs(leftY - rightY) > 0.015 {
                    return leftY > rightY
                }
                return $0.boundingBox.minX < $1.boundingBox.minX
            }
            let lines = observations.compactMap { $0.topCandidates(1).first?.string }
            corpus += "\n\n===== PAGE \(pageIndex + 1) =====\n" + lines.joined(separator: "\n")
            fputs("OCR page \(pageIndex + 1)/\(document.pageCount)\n", stderr)
        } catch {
            corpus += "\n\n===== PAGE \(pageIndex + 1) - OCR ERROR: \(error) =====\n"
        }
    }
}

do {
    try corpus.write(to: output, atomically: true, encoding: .utf8)
    print("Wrote \(output.path)")
} catch {
    fputs("Write failed: \(error)\n", stderr)
    exit(1)
}
