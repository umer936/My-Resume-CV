# My-CV


Generated PDFs:
- 2023 Resume: `Resume.pdf` (root-level symlink) → [output_pdfs/old/2023/2023_Resume.pdf](https://raw.githubusercontent.com/umer936/My-Resume-CV/master/output_pdfs/old/2023/2023_Resume.pdf)
<!-- - Full CV (old) (Specific parts go into Resume): [output_pdfs/cv.pdf](https://raw.githubusercontent.com/umer936/My-Resume-CV/master/output_pdfs/cv.pdf)
- Full CV (old) Black and White: [output_pdfs/cv_BW.pdf](https://raw.githubusercontent.com/umer936/My-Resume-CV/master/output_pdfs/cv_BW.pdf)
- References: [output_pdfs/references.pdf](https://raw.githubusercontent.com/umer936/My-Resume-CV/master/output_pdfs/references.pdf) -->

## Notes

- `Resume.pdf` is just a convenience symlink; the canonical archived 2023 PDF lives in `output_pdfs/old/2023/`.
- Git LFS is not necessary for the current layout. This repo only keeps a small number of PDF artifacts, so regular Git is simpler and works fine.
- If the repo ever grows to include many large binary revisions, then Git LFS would be worth reconsidering.
- All organization is handled locally. Use the helper script below when you want to archive a retired release into `output_pdfs/old/<year>/`.
- I would **not** auto-move PDFs into `output_pdfs/old/` based on filename guessing alone. That kind of archival is better done explicitly when you publish a new annual version, because guessing can misfile things.

## Standardized archiving

When you retire a yearly release, archive it explicitly with:

```powershell
./archive-resume.ps1 -Year 2023
```

That moves matching `2023*.pdf` files from `output_pdfs/` into `output_pdfs/old/2023/`.

This keeps the archive layout predictable without relying on filename guessing.

## Rebuilding locally

If you want to regenerate the resume, compile `2023_Resume.tex` with XeLaTeX. A common workflow is:

```bash
latexmk -xelatex 2023_Resume.tex
```

If you prefer not to use `latexmk`, run `xelatex` directly a couple of times until the references settle.
