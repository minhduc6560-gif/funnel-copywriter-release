---
name: document-source-ingestion
description: Extract source documents for downstream work.
version: 0.1.0
author: Minh Duc (minhduc6560-gif), Hermes Agent
license: MIT
platforms:
- linux
- macos
- windows
metadata:
  hermes:
    tags:
    - documents
    - pdf
    - ocr
    - source-ingestion
    - verification
    related_skills: []
---

# Document Source Ingestion

Use this skill when a task depends on understanding supplied PDFs, Office files, ebooks, reports, manuals, or other source documents. Its job is to produce a faithful, traceable text corpus before downstream analysis, copywriting, summarization, or implementation begins.

This is a class-level ingestion skill. It does not replace the downstream domain skill. Load both this skill and the relevant copywriting, research, legal, product, or coding skill when the source document materially governs the output.

## Core Rule

Do not draft from filenames, cover copy, attachment summaries, or partial previews when the user asks you to use the document's contents. Extract the full source, inspect it, and keep page or section boundaries when possible.

## Workflow

### Step 1 - Inventory the supplied sources

- Resolve the exact file paths rather than reconstructing Unicode-heavy names by hand.
- Identify the primary source, supporting assets, and output destination.
- Record the format, page count when available, and whether the document appears text-native or image-based.

Completion criterion: every source that can affect the deliverable has an exact path and an assigned role.

### Step 2 - Attempt native extraction first

Use the normal document-reading tool first. Native extraction is preferable because it preserves text more accurately and is faster than OCR.

If extraction succeeds:

- Read the complete content, paging through truncated output.
- Preserve page, heading, table, and list boundaries when available.
- Note obvious extraction defects before using the text as evidence.

If extraction reports that a page needs OCR, switch to an OCR path instead of concluding that the document is unreadable.

### Step 3 - OCR image-only PDFs

Choose an available, reproducible OCR path for the current platform. On macOS, `scripts/ocr_pdf_macos.swift` is a tested native fallback using PDFKit for rendering and Vision for recognition. See `references/scanned-pdf-ocr.md`.

Requirements:

- OCR every page, not only the cover or a sample.
- Preserve explicit page delimiters in the output.
- Use the document's primary language plus an appropriate fallback language.
- Save the OCR result as UTF-8 text for review and reuse.

Completion criterion: all pages produce text or carry an explicit per-page OCR error marker.

### Step 4 - Inspect the extracted corpus

Read the entire extracted text before writing. Build a compact source map containing:

- Document title and owner/brand.
- Intended audience.
- Core problem and promised value.
- Named frameworks, steps, strategies, or chapters.
- Approved claims, proof, examples, credentials, and caveats.
- Links, asset names, and calls to action.
- Facts that remain unknown.

Treat OCR text as evidence that may contain character errors. Normalize obvious spacing and accent errors in your notes, but never silently repair identifiers, URLs, prices, statistics, names, or quotations. Verify those against the rendered page when they matter.

### Step 5 - Separate source facts from inference

Label each downstream input as one of:

- **Explicit:** stated directly in the source.
- **Reasonable inference:** strongly implied by the source and disclosed as an assumption.
- **Missing:** not present and must be requested or marked with a placeholder.

Do not turn inference into a credential, guarantee, testimonial, statistic, deadline, or legal claim.

### Step 6 - Hand off to the downstream skill

Pass the source map, exact asset paths, approved claims, and missing facts into the relevant domain workflow. For lead-funnel copywriting, derive the audience, quick win, lead-magnet contents, proof, CTA, and brand voice from the document where supported; mark traffic source, delivery link, support details, or expert identity as missing when absent.

### Step 7 - Verify ingestion before final delivery

Check that:

- Every page or section was processed.
- The extracted text contains the beginning, middle, and end of the document.
- Major numbered lists have the expected range and no silent gaps.
- Claims used downstream can be traced to the source.
- OCR uncertainty is not presented as an exact quote or identifier.
- The final artifact exists in the requested destination.

## Claim Safety

- Source presence does not make every statement universally true; attribute claims when needed.
- Distinguish worked examples from general guarantees.
- Preserve caveats attached to statistics and case studies.
- Do not promote an OCR-corrupted line into customer-facing proof.
- When using cover copy as authority language, identify it as cover copy unless independently supported elsewhere in the source.

## Pitfalls

1. **Drafting from the attachment tree:** filenames reveal the topic, not the substance.
2. **Stopping at an OCR error:** switch to a supported OCR route and process all pages.
3. **Reading only the first pages:** introductions rarely contain the complete framework.
4. **Losing page boundaries:** page markers make spot-checking and claim tracing possible.
5. **Treating OCR as ground truth:** names, URLs, numbers, and quotations require extra care.
6. **Inventing missing campaign inputs:** document content may establish the offer and voice but not traffic source, delivery behavior, CRM syntax, or support contact.
7. **Confusing an example with a promise:** worked conversion scenarios illustrate a mechanism; they do not guarantee the same result for every reader.

## Supporting Files

- `references/scanned-pdf-ocr.md` - detection, execution, and validation notes for image-only PDF ingestion.
- `scripts/ocr_pdf_macos.swift` - tested macOS PDFKit/Vision OCR script that emits page-delimited UTF-8 text.
