# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

Static educational site (pure HTML/CSS/JS, no build tools, no frameworks, no package.json) about Linear Programming ("Otimização Linear"), in Portuguese. Hosted on GitHub Pages. Content covers Simplex, duality, sensitivity analysis, integer programming (branch & bound), and includes an interactive Simplex solver and a 2D graphical solver.

## Folder structure

```
/                       — GitHub Pages root
├── index.html          — landing page / navigation hub (must stay at repo root for GitHub Pages)
├── pages/               — every other page
│   ├── teoria.html          — theory reference (Simplex, duality, sensitivity analysis)
│   ├── exercicios.html      — large collection of worked exercises (~4400 lines; each exercise is a self-contained section with a sidebar/select nav)
│   ├── solver.html          — interactive Simplex solver (user enters objective + constraints, runs tableau step-by-step in JS)
│   ├── grafico.html         — interactive 2D graphical LP solver (plots constraints, feasible region, optimal vertex)
│   └── guia-prova-final.html — exam-prep guide (Big-M, Duas Fases, sensitivity analysis walkthroughs)
├── assets/css/style.css — shared stylesheet for all pages
├── scripts/             — Windows helper .ps1 scripts (see below)
├── docs/                 — DEPLOY.md, design-prompt.md
├── materiais/            — gitignored personal study material (PDFs/images), never published
├── README.md
└── CLAUDE.md
```

Every `.html` file embeds its own `<script>` logic inline (no shared JS file), so solver/graph algorithms live entirely inside `pages/solver.html` and `pages/grafico.html` respectively.

`index.html` stays at the repository root — GitHub Pages serves it as the site's entry point (`/`) without extra config. All other pages live in `pages/` and link back to it via `../index.html`; they reference the stylesheet via `../assets/css/style.css`. `index.html` itself links into `pages/` (e.g. `href="pages/teoria.html"`).

## Running the site

There is no build/dev server tooling. Just open the HTML files directly in a browser, or serve the directory statically, e.g.:

```bash
python -m http.server 8000
```

## Deployment

Deployed to GitHub Pages from the `main` branch root (see `docs/DEPLOY.md`, in Portuguese). Basic flow:

```bash
git add .
git commit -m "..."
git push
```

`scripts/update-git.ps1` and `scripts/setup-git.ps1` are Windows helper scripts used by the site owner to sync a working copy of these files to a separate desktop repo directory and push — they hardcode a destination path (`$env:USERPROFILE\Desktop\otimizacao-linear`) and a fixed file list (mirroring the folder structure above: `index.html`, `pages/*.html`, `assets/css/style.css`, `docs/DEPLOY.md`). If asked to update the "live" repo via these scripts, note they copy only the specific files listed inside the script — adding a new page requires updating that list too.

## Design system

Full design spec lives in `docs/design-prompt.md` — read it before making visual/CSS changes. Key points:

- Colors are CSS custom properties on `:root` (`--primary`, `--accent`, `--bg`, `--surface`, `--border`, `--text`, `--text-muted`, `--success`, `--warning`, `--danger`) defined in `assets/css/style.css`.
- No Google Fonts / external font loading — system font stack only (`'Segoe UI', system-ui, sans-serif`), monospace (`'Courier New'`) for math/CPLEX-style blocks.
- `--radius: 8px`, subtle shadows (`--shadow: 0 1px 4px rgba(0,0,0,.08)`).
- Simplified BEM naming (`.componente`, `.componente-elemento`, `.componente--modificador`); CSS section comments use `/* ── Nome ── */`.
- Domain-specific component classes to reuse rather than reinvent: `.phase` / `.phase-head` / `.phase-tag` / `.phase-body` (exercise sections), `.badge-blue/green/orange`, `.alert-info/success/warning`, Simplex tableau cell classes `.pivot`, `.basis`, `.result`.
- Responsive breakpoints: 900px, 768px, 640px, 600px — see `docs/design-prompt.md` for what collapses at each.

When adding new exercises or theory sections, match the existing structural patterns in `pages/exercicios.html`/`pages/teoria.html` (phase/step/tableau markup) rather than introducing new layout patterns.
