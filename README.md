# My-CV


Generated PDFs:
- 2023 Resume: `Resume.pdf` (root-level symlink) → [output_pdfs/2023_Resume.pdf](https://raw.githubusercontent.com/umer936/My-Resume-CV/master/output_pdfs/2023_Resume.pdf)
- 2023 Resume Black and White (Print): [output_pdfs/2023_Resume_BW.pdf](https://raw.githubusercontent.com/umer936/My-Resume-CV/master/output_pdfs/2023_Resume_BW.pdf)
<!-- - Full CV (old) (Specific parts go into Resume): [output_pdfs/cv.pdf](https://raw.githubusercontent.com/umer936/My-Resume-CV/master/output_pdfs/cv.pdf)
- Full CV (old) Black and White: [output_pdfs/cv_BW.pdf](https://raw.githubusercontent.com/umer936/My-Resume-CV/master/output_pdfs/cv_BW.pdf)
- References: [output_pdfs/references.pdf](https://raw.githubusercontent.com/umer936/My-Resume-CV/master/output_pdfs/references.pdf) -->

## Notes

- `Resume.pdf` is just a convenience symlink; the canonical generated file lives in `output_pdfs/`.
- Git LFS is not necessary for the current layout. This repo only keeps a small number of PDF artifacts, so regular Git is simpler and works fine.
- If the repo ever grows to include many large binary revisions, then Git LFS would be worth reconsidering.
- A GitHub Action now builds `2023_Resume.tex` on push and pull request so the resume stays compilable.
- I would **not** auto-move PDFs into `output_pdfs/old/` based on year alone. That kind of archival is better done explicitly when you publish a new annual version, because year-based detection can misfile things.
- If you do want to archive an older release, copy it into a specific folder such as `output_pdfs/old/2023/` on purpose rather than guessing from the filename.

## Rebuilding locally

If you want to regenerate the resume, compile `2023_Resume.tex` with XeLaTeX. A common workflow is:

```bash
latexmk -xelatex 2023_Resume.tex
```

If you prefer not to use `latexmk`, run `xelatex` directly a couple of times until the references settle.
