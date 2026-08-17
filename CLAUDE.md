# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A Quarto book of personal class notes for **Lego III: Causal Inference** (IESP-UERJ, 2026/1). Each `aulas/aula-XX.qmd` corresponds to one class session. The book is rendered to `docs/` and published to GitHub Pages via a GitHub Actions workflow on every push to `main`.

## Build and preview

```bash
# Render the whole book
quarto render

# Preview locally with live reload
quarto preview
```

Output lands in `docs/` (gitignored). Never commit `docs/` manually — CI handles it.

## CI/CD

`.github/workflows/publish.yml` runs on push to `main`:
1. Installs R 4.4 and the packages listed in the workflow's `install.packages()` call.
2. Runs `quarto render`.
3. Deploys `docs/` to the `gh-pages` branch via `peaceiris/actions-gh-pages`.

**When adding a new R package**, add it to both the `.qmd` `library()` call and the `install.packages()` list in the workflow.

## Adding a new class file

1. Create `aulas/aula-XX.qmd` with frontmatter:
   ```yaml
   ---
   title: "Título"
   subtitle: "Aula XX"
   date: YYYY-MM-DD
   ---
   ```
2. Register it in `_quarto.yml` under `book.chapters`.

## Math and formatting conventions

- Display math blocks (`$$...$$`) must have a **blank line above and below**.
- Use `^\top` for matrix transpose, never `'`.
- Use `\begin{align*}...\end{align*}` for multi-step equation chains.
- Use `\mathbb{E}`, `\text{Cov}`, `\text{Var}` (with `\text{}`) for operators.
- Box key results with `$\boxed{...}$`.

## R code conventions

- Every `.qmd` that uses R starts with a hidden setup chunk:
  ```r
  #| include: false
  library(...)
  ```
- DAGs are built with `ggdag::dagify()` + `ggdag()` + `theme_dag()`.
- IV estimation uses the `ivreg` package (`ivreg(y ~ x | z, data = ...)`).
- Chunk options go as `#| key: value` YAML, not as `knitr::opts_chunk`.
