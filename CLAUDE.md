# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

Static educational site (pure HTML/CSS/JS, no build tools, no frameworks, no package.json) about Linear Programming ("Otimização Linear"), in Portuguese. Hosted on GitHub Pages. Content covers Simplex, duality, sensitivity analysis, integer programming (branch & bound), and includes an interactive Simplex solver and a 2D graphical solver.

Pages:
- `index.html` — landing page / navigation hub
- `teoria.html` — theory reference (Simplex, duality, sensitivity analysis)
- `exercicios.html` — large collection of worked exercises (~4400 lines; each exercise is a self-contained section with a sidebar/select nav)
- `solver.html` — interactive Simplex solver (user enters objective + constraints, runs tableau step-by-step in JS)
- `grafico.html` — interactive 2D graphical LP solver (plots constraints, feasible region, optimal vertex)
- `style.css` — shared stylesheet for all pages

No test suite, no linter, no build step. Every `.html` file embeds its own `<script>` logic inline (no shared JS file), so solver/graph algorithms live entirely inside `solver.html` and `grafico.html` respectively.

## Running the site

There is no build/dev server tooling. Just open the HTML files directly in a browser, or serve the directory statically, e.g.:

```bash
python -m http.server 8000
```

## Deployment

Deployed to GitHub Pages from the `main` branch root (see `DEPLOY.md`, in Portuguese). Basic flow:

```bash
git add .
git commit -m "..."
git push
```

`update-git.ps1` and `setup-git.ps1` are Windows helper scripts used by the site owner to sync a working copy of these files to a separate desktop repo directory and push — they hardcode a destination path (`$env:USERPROFILE\Desktop\otimizacao-linear`) and a fixed file list. If asked to update the "live" repo via these scripts, note they copy only the specific files listed inside the script (`index.html`, `teoria.html`, `exercicios.html`, `solver.html`, `grafico.html`, `style.css`, `DEPLOY.md`) — adding a new page requires updating that list too.

## Design system

Full design spec lives in `design-prompt.md` — read it before making visual/CSS changes. Key points:

- Colors are CSS custom properties on `:root` (`--primary`, `--accent`, `--bg`, `--surface`, `--border`, `--text`, `--text-muted`, `--success`, `--warning`, `--danger`) defined in `style.css`.
- No Google Fonts / external font loading — system font stack only (`'Segoe UI', system-ui, sans-serif`), monospace (`'Courier New'`) for math/CPLEX-style blocks.
- `--radius: 8px`, subtle shadows (`--shadow: 0 1px 4px rgba(0,0,0,.08)`).
- Simplified BEM naming (`.componente`, `.componente-elemento`, `.componente--modificador`); CSS section comments use `/* ── Nome ── */`.
- Domain-specific component classes to reuse rather than reinvent: `.phase` / `.phase-head` / `.phase-tag` / `.phase-body` (exercise sections), `.badge-blue/green/orange`, `.alert-info/success/warning`, Simplex tableau cell classes `.pivot`, `.basis`, `.result`.
- Responsive breakpoints: 900px, 768px, 640px, 600px — see `design-prompt.md` for what collapses at each.

When adding new exercises or theory sections, match the existing structural patterns in `exercicios.html`/`teoria.html` (phase/step/tableau markup) rather than introducing new layout patterns.
