# CQC Statistical Guidance

**Practical Statistical Methods for Regulatory Analytics**

A comprehensive guide for CQC analysts covering foundational statistical concepts and core analytical methods used in regulatory work.

---

## 📚 Contents

### Part I: Foundations
1. **Getting Started** - How to use this guidance
2. **Data Types** - Understanding your data
3. **Uncertainty & Variation** - Natural variation vs real differences
4. **QA & Data Checks** - Missing data and outliers

### Part II: Core Methods
5. **Z-scoring** - Comparing providers to national averages
6. **SPC Basics** - Statistical process control charts
7. **t-tests** - Comparing means between groups

### Appendices
- **Figures** - All visualizations with executable code
- **Glossary** - Statistical terms and definitions
- **References** - Further reading and resources

---

## 🚀 Quick Start

### Prerequisites

- **Quarto** (version 1.3+): [Download here](https://quarto.org/docs/get-started/)
- **R** (version 4.0+): [Download here](https://cran.r-project.org/)
- **R Packages**: See [R_PACKAGE_SETUP.md](R_PACKAGE_SETUP.md)

### Installation

1. **Clone or download this repository**

2. **Install R packages** (required for figures):
   ```r
   # In R console:
   install.packages(c("rmarkdown", "knitr", "jsonlite", "ggplot2", "e1071"))
   ```
   
   See [R_PACKAGE_SETUP.md](R_PACKAGE_SETUP.md) for detailed instructions.

3. **Preview the book**:
   ```bash
   quarto preview
   ```

4. **Render the book**:
   ```bash
   quarto render
   ```
   
   Output will be in the `_book/` directory.

---

## 💡 Features

### Dual R/Python Code Examples
All code examples are provided in both R and Python with synchronized tab switching:

```markdown
:::: {.panel-tabset group="language"}
## R
# R code here

## Python  
# Python code here
::::
```

### Interactive Figures
All figures are generated from executable code, ensuring reproducibility:
- 8 statistical distribution visualizations
- Consistent styling and color palette
- High-resolution output (300 DPI)

### Layered Learning
- **Main text**: Core concepts and practical guidance
- **Rethinking boxes**: Deeper conceptual insights
- **Overthinking boxes**: Advanced topics and edge cases

---

## 📖 Using This Guidance

### For Analysts
- **Browse online**: Navigate using the table of contents
- **Search**: Use the search function to find specific topics
- **Copy code**: All code examples are copy-pastable
- **Choose language**: Switch between R and Python as needed

### For Developers
- **Modify content**: Edit `.qmd` files in `chapters/` directory
- **Add figures**: Update `chapters/00-figures.qmd`
- **Update styling**: Modify `_quarto.yml`
- **Version control**: All content is text-based for easy tracking

---

## 📁 Project Structure

```
guidance/
├── _quarto.yml              # Book configuration
├── index.qmd                # Landing page
├── quick-reference.qmd      # Quick reference guide
├── references.bib           # Bibliography
├── README.md                # This file
├── .gitignore               # Git exclusions
│
├── chapters/                # Main content
│   ├── 00-figures.qmd       # Figure generation code
│   ├── 01-getting-started.qmd
│   ├── 02-data-types.qmd
│   ├── 03-uncertainty-variation.qmd
│   ├── 04-qa-data-checks.qmd
│   ├── 05-z-scoring.qmd
│   ├── 06-spc-basics.qmd
│   └── 07-t-tests.qmd
│
├── appendices/              # Reference materials
│   ├── glossary.qmd
│   └── references.qmd
│
├── figures/                 # Figure generation
│   └── generate_figures.R   # Standalone figure script
│
├── docs/                    # Documentation
│   ├── original.tex         # Original guidance (reference)
│   └── project-docs/        # Development notes (not synced)
│
└── _book/                   # Rendered output (not synced)
```

---

## 🛠️ Development

### Making Changes

1. **Edit content**: Modify `.qmd` files in `chapters/` or `appendices/`
2. **Preview changes**: Run `quarto preview` to see live updates
3. **Test rendering**: Run `quarto render` to generate full book
4. **Check output**: Review `_book/index.html`

### Adding New Sections

1. Create new `.qmd` file in `chapters/`
2. Add to `_quarto.yml` under appropriate part
3. Update cross-references as needed
4. Add glossary terms if introducing new concepts

### Adding Figures

1. Add R code chunk to `chapters/00-figures.qmd`
2. Use label format: `#fig-descriptive-name`
3. Add descriptive caption
4. Reference in text using `@fig-descriptive-name`

---

## 📊 Code Examples

### R and Python Support

All statistical methods include equivalent code in both languages:

**R packages used**:
- Base R, stats
- ggplot2 (visualization)

**Python packages used**:
- numpy, pandas
- scipy.stats
- matplotlib

### Installation

**Python packages**:
```bash
pip install numpy pandas scipy matplotlib
```

**R packages**:
```r
install.packages(c("ggplot2"))
```

---

## 🎨 Styling and Themes

### Callout Boxes

- **Note** (blue): Additional information
- **Tip** (green): Practical advice
- **Warning** (yellow): Important caveats
- **Caution** (red): Critical warnings

### Code Blocks

- Syntax highlighting for R and Python
- Line numbers for longer examples
- Copy button for easy code extraction

### Figures

- Consistent color palette (blue, red, purple)
- Color-blind friendly
- High-resolution for print

---

## 📝 Documentation

Development documentation is available in `docs/project-docs/` (not synced to git):
- Implementation plans and specifications
- Code conversion details
- Figure generation documentation
- Development progress tracking

For R package installation help, see the project-docs folder.

---

## 🤝 Contributing

### Content Guidelines

1. **Teach judgment, not rules** - No mechanical thresholds
2. **Questions first, methods second** - Structure around analyst needs
3. **Respect complexity** - Acknowledge uncertainty and trade-offs
4. **Multiple valid approaches** - Present options with pros/cons
5. **Real CQC context** - Use realistic regulatory scenarios

See [PROJECT_RULES.md](PROJECT_RULES.md) for detailed guidelines.

### Code Standards

- Keep files under 300 lines
- Test all code examples
- Provide both R and Python equivalents
- Include comments explaining key steps
- Use descriptive variable names

---

## 🧪 Testing

### Before Deployment

- [ ] All chapters render without errors
- [ ] All code examples run successfully
- [ ] All cross-references work
- [ ] All figures display correctly
- [ ] Both HTML and PDF output work
- [ ] Search functionality works
- [ ] Tab switching works across all code blocks

### Browser Testing

Test in:
- Chrome/Edge (Chromium)
- Firefox
- Safari (if available)

---

## 📄 License

Internal CQC document. Not for external distribution without approval.

---

## 👥 Authors

**CQC Data & Insight**  
Quantitative Analytics Guild

---

## 📞 Support

For questions or issues:
1. Check the [Glossary](appendices/glossary.qmd) for term definitions
2. Review [Getting Started](chapters/01-getting-started.qmd) for usage guidance
3. Contact the Quantitative Analytics Guild

---

## 🎯 Status

**Current Version**: 1.0 (Draft)  
**Completion**: ~95%  
**Last Updated**: November 2025

### Completed
✅ All foundation sections (1-4)  
✅ Core methods (5-7)  
✅ Dual R/Python code blocks (40+ examples)  
✅ 8 of 9 figures implemented  
✅ Comprehensive glossary (70+ terms)  
✅ Quick reference guide  
✅ Bibliography and references  

### Pending
📝 Figure 1 (decision tree flowchart)  
📝 Full testing (HTML + PDF)  
📝 Pilot with analyst teams  
📝 Final review and sign-off  

---

## 🚀 Next Steps

1. **Install R packages** (see R_PACKAGE_SETUP.md)
2. **Test rendering**: `quarto preview`
3. **Review content**: Navigate through all sections
4. **Provide feedback**: Note any issues or suggestions
5. **Pilot deployment**: Test with target analyst teams

---

**Ready to get started? Run `quarto preview` and explore the guidance!** 📊
