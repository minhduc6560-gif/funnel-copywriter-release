# Scanned PDF OCR Reference

Use this reference when normal PDF extraction reports that one or more pages need OCR.

## Decision Path

1. Try native document extraction first.
2. If the file is image-only, establish the full page range.
3. Select an OCR engine available on the current platform.
4. Render at sufficient resolution for body text.
5. OCR every page using the primary document language and a fallback language.
6. Write explicit page delimiters such as `===== PAGE 12 =====`.
7. Read the resulting corpus from beginning to end before using it.

## Tested macOS Native Route

The bundled script uses:

- PDFKit to open and render each PDF page.
- Core Graphics to rasterize pages at 2.5x scale.
- Vision `VNRecognizeTextRequest` with accurate recognition and language correction.
- UTF-8 output with a page delimiter for every page.

Run:

```bash
swift scripts/ocr_pdf_macos.swift "$INPUT_PDF" "$OUTPUT_TXT" --languages vi-VN,en-US
```

The script prints progress to stderr and the output path on success.

## Verification Checklist

- Progress reaches the known final page.
- Output includes delimiters for page 1 and the final page.
- The title, a middle section, and the final section are legible.
- Numbered frameworks are continuous.
- URLs, names, prices, percentages, dates, and direct quotations are spot-checked against the rendered page before publication.

## Downstream Use

Create a source map rather than pasting raw OCR directly into a deliverable. Preserve exact claims only when legible. Mark inferred audience or use cases as assumptions. Treat cover taglines as attributed marketing language, not independently verified credentials.


The bundled OCR script is macOS-only because it uses PDFKit, Vision, and AppKit. It refuses to overwrite the output unless `--force` is supplied; pass `--languages` with a comma-separated list when language hints are needed.
