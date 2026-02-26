# University of the Aegean — PhD Dissertation Template

LaTeX template for PhD dissertations at the **Department of Cultural Technology
and Communication**, University of the Aegean. Produces bilingual (Greek/English)
title pages, abstract pages, and a full dissertation structure.

See `SAMPLE_OUTPUT.pdf` for a preview of what the compiled template looks like.

## Prerequisites

### TeX Distribution
Install **TeX Live 2024+** (full or at least the XeLaTeX scheme):
- macOS: `brew install --cask mactex` or download from https://tug.org/mactex/
- Linux: `sudo apt install texlive-full` (Debian/Ubuntu) or equivalent
- Windows: https://tug.org/texlive/ or MiKTeX

### Required Fonts (must be installed on your system)
| Font             | Used for        | Download |
|------------------|-----------------|----------|
| **EB Garamond**  | Body text, math | https://fonts.google.com/specimen/EB+Garamond |
| **Lato**         | Sans-serif      | https://fonts.google.com/specimen/Lato |
| **Source Code Pro** | Code listings | https://fonts.google.com/specimen/Source+Code+Pro |

On macOS, install fonts by double-clicking the `.ttf`/`.otf` files.
On Linux, copy them to `~/.local/share/fonts/` and run `fc-cache -fv`.

## Quick Start

1. **Edit your metadata** in `frontmatter/personalize.tex`:
   - Title (English and Greek)
   - Author name
   - Committee members
   - Degree details, field, year

2. **Write your content** in the `chapters/` directory:
   - `introduction.tex` and `conclusion.tex` are provided as starters
   - Create additional chapter files (e.g., `chapters/background.tex`)
   - Add `\include{chapters/background}` in `dissertation.tex`

3. **Write your abstracts** in `frontmatter/abstract.tex` (English) and
   `frontmatter/abstract_gr.tex` (Greek).

4. **Add your references** to `references.bib` in BibTeX format.

5. **Build the PDF**:
   ```bash
   # Using the included build script:
   sh scripts/build

   # Or manually:
   xelatex dissertation
   bibtex dissertation
   xelatex dissertation
   xelatex dissertation
   ```
   You need to run XeLaTeX multiple times so that cross-references, the table
   of contents, and bibliography are resolved correctly.

## File Structure

```
├── dissertation.tex           # Main document — add/remove chapters here
├── Dissertate.cls             # Document class (formatting, macros, layout)
├── references.bib             # Your bibliography database
├── frontmatter/
│   ├── personalize.tex        # *** YOUR METADATA — edit this first ***
│   ├── abstract.tex           # English abstract
│   ├── abstract_gr.tex        # Greek abstract
│   ├── dedication.tex         # Dedication page
│   ├── thanks.tex             # Acknowledgments
│   ├── authorlist.tex         # Optional co-author list per chapter
│   └── preface.tex            # Optional preface
├── chapters/
│   ├── introduction.tex       # Sample introduction
│   ├── conclusion.tex         # Sample conclusion
│   └── ...                    # Add your chapters here
├── endmatter/
│   ├── personalize.tex        # (empty, reserved for back matter customization)
│   └── colophon.tex           # Colophon page (typesetting credits)
├── figures/
│   ├── logo-aegean-en.pdf     # University logo (English)
│   ├── logo-aegean-el.pdf     # University logo (Greek)
│   ├── logo-dept.png          # Department logo (Greek)
│   └── logo-dept-en.png       # Department logo (English)
├── scripts/
│   └── build                  # Shell script to compile the dissertation
├── SAMPLE_OUTPUT.pdf          # Preview of what the template produces
└── README.md                  # This file
```

## Key Features

- **Bilingual title pages**: Greek title page first, then English, both with
  university/department logos and the full 7-member examination committee.
- **XeLaTeX + Polyglossia**: Full Unicode support, proper Greek typesetting
  via `\begin{greek}...\end{greek}`.
- **EB Garamond typography**: Elegant oldstyle-numeral body text with matching
  math fonts.
- **Chapter epigraphs**: Use `\begin{savequote}...\end{savequote}` before
  `\chapter{}` for opening quotes.
- **Compressed spacing environments**: Quotes, lists, bibliography, and TOC
  use tighter spacing automatically.
- **Code listings**: Pre-configured `lstlisting` environment with line numbers,
  syntax highlighting, and single spacing.
- **Theorem environments**: `theorem`, `proposition`, `lemma`, `corollary`,
  `definition`, `property` — all numbered per chapter.

## Tips

- **Adding a chapter**: Create `chapters/mychapter.tex`, then add
  `\include{chapters/mychapter}` in `dissertation.tex` between the existing
  `\include` lines.
- **Appendices**: Uncomment the `\appendix` block in `dissertation.tex` and
  create appendix files in `chapters/`.
- **Figures**: Place figure files in `figures/` — PDF, PNG, and JPG all work.
  They are found automatically via `\graphicspath{{figures/}}`.
- **Bibliography style**: Uses `apalike2` (author-year, included in TeX Live).
  Citations use `natbib` with numeric superscript style by default.
- **Proofreading build**: You can create a `dissertation_proof.tex` variant
  with the `dsingle` class option for a more compact single-spaced draft.

## License

This template is distributed under the **GNU Affero General Public License v3
(AGPL-3.0)**, the same license as the upstream Dissertate project.
See https://www.gnu.org/licenses/agpl-3.0.html for the full license text.

You are free to use, modify, and redistribute this template, provided that any
modified versions you distribute also carry the AGPL-3.0 license and make the
source available.

## Credits

- **Original template**: [Dissertate](https://github.com/suchow/Dissertate) by
  Jordan Suchow (AGPL-3.0). A general-purpose dissertation class originally
  designed for Harvard, providing the core document class, typography choices,
  and frontmatter/backmatter structure.

- **University of the Aegean adaptation**: Michail Pantelelis
  (mpantel@aegean.gr). Adapted the template for the University of the Aegean,
  Department of Cultural Technology and Communication:
  - Bilingual (Greek/English) title pages with university and department logos
  - Greek abstract page via Polyglossia
  - 7-member examination committee layout (3 advisory + 4 examiners)
  - Greek metadata commands (`\titlegr`, `\authorgr`, `\advisorgr`, etc.)
  - `\maketitlegreek` command for the Greek title page
  - Department-specific defaults (university name, city, department)
  - Compressed spacing for bibliography and TOC/LOF/LOT
  - Theorem environments (theorem, proposition, lemma, definition, property)
