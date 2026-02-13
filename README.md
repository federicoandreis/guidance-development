# CQC Statistical Guidance

**Statistical Methods for Regulatory Analysis**

Practical guidance for CQC analysts: 15 chapters, 10 worked examples, and complete R + Python code throughout.

---

## Contents

### Part I: Foundations (Chapters 01-09)
- Getting Started, Data Types, Describing Data, Measuring Variation, Distribution Shape, Unusual Observations, Missing Data Foundations, Statistical Inference, QA Principles

### Part II: Core Methods (Chapters 10-15)
- Z-scoring, SPC Basics, t-tests, Correlation, Outlier Detection, Missing Data Methods

### Part III: Worked Examples (10 examples)
- Complete analytical workflows using realistic CQC data, with dual R/Python code

### Appendices
- Glossary (70+ terms) and References

---

## Quick Start

### Prerequisites

- **Quarto** (1.1+): <https://quarto.org/docs/get-started/>
- **R** (4.0+) with packages: `rmarkdown`, `knitr`, `ggplot2`, `reticulate`, `e1071`
- **Python** (3.8+) with packages: `pandas`, `numpy`, `scipy`, `matplotlib`, `statsmodels`

### Setup

1. Clone or download this repository

2. Create a `.Renviron` file in the project root with your Python path:
   ```
   RETICULATE_PYTHON=/path/to/your/python
   ```
   This file is gitignored (machine-specific). The Python environment needs `pandas`, `numpy`, `scipy`, and `statsmodels`.

3. Install R packages:
   ```r
   install.packages(c("rmarkdown", "knitr", "ggplot2", "reticulate", "e1071"))
   ```

4. Preview:
   ```bash
   quarto preview
   ```

5. Render:
   ```bash
   quarto render
   ```
   Output goes to `_book/`.

---

## Project Structure

```
guidance/
├── _quarto.yml            # Book configuration
├── .Rprofile              # Python setup documentation
├── .Renviron              # Python path (gitignored, machine-specific)
├── .windsurfrules         # Project rules for AI assistants
├── index.qmd              # Landing page
├── quick-reference.qmd    # Method selection guide
├── references.bib         # Bibliography (17 entries)
├── custom.css             # Nav cards, workflow cards, decision tree
├── chapters/              # 01-15 (9 foundations + 6 methods)
├── examples/              # 10 worked examples + README + data/
├── appendices/            # Glossary + References
├── figures/               # 3 static figures (skewness, kurtosis, z-score)
├── docs/
│   ├── project-docs/      # Core reference docs
│   └── context/           # Source materials
└── _book/                 # Rendered HTML output (gitignored)
```

---

## Features

- **Three-layer learning**: Main text + Rethinking boxes (contextual judgment) + Overthinking boxes (technical edge cases)
- **Dual R/Python code**: All methods and examples in both languages with tab switching
- **Standard methods structure**: Problem statement, prerequisites, step-by-step guide, worked example, common pitfalls, QA documentation, escalation guidance
- **Quick Reference**: Scenario tables, data-type matrix, decision tree, workflow cards
- **Real CQC context**: GP access, care home falls, ambulance handovers, infection rates, etc.

---

## Contributing

### Content Principles

1. **Teach judgment, not rules** - No mechanical thresholds
2. **Questions first, methods second** - Structure around analyst needs
3. **Respect complexity** - Acknowledge uncertainty and trade-offs
4. **Multiple valid approaches** - Present options with pros/cons
5. **Real CQC context** - Use realistic regulatory scenarios

See `.windsurfrules` for full project rules and `docs/project-docs/guidance.md` for detailed writing guidance.

### Development

1. Edit `.qmd` files in `chapters/`, `examples/`, or `appendices/`
2. Run `quarto preview` for live updates
3. Add new chapters to `_quarto.yml`
4. Update cross-references (`@sec-*` format)
5. Add glossary terms for new concepts

---

## Status

**Version**: 1.0 | **Last Updated**: February 2026

- 15 chapters complete (9 foundations + 6 methods)
- 10 worked examples with dual R/Python code
- Full render: 30/30 files, all cross-references verified
- Ready for pilot with analyst teams

---

## Support

1. Check the [Glossary](appendices/glossary.qmd) for term definitions
2. Start with [Getting Started](chapters/01-getting-started.qmd) for orientation
3. Use the [Quick Reference](quick-reference.qmd) to find the right method
4. Contact the Quantitative Analytics Guild for specialist support

**Internal CQC document. Not for external distribution without approval.**
