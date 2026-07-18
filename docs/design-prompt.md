# Design Prompt — Site Otimização Linear

## Visão Geral

Site educacional estático (HTML/CSS/JS puro, sem frameworks), hospedado no GitHub Pages. Visual limpo, acadêmico e funcional, inspirado em dashboards SaaS modernos. Prioridade: legibilidade de conteúdo matemático em desktop e mobile.

---

## Paleta de Cores

| Token | Hex | Uso |
|---|---|---|
| `--primary` | `#1a56db` | Navbar, botões principais, títulos h2, bordas de destaque |
| `--primary-dk` | `#1240a8` | Hover de botões primários |
| `--accent` | `#0ea5e9` | Gradiente do hero (lado direito) |
| `--bg` | `#f8fafc` | Background geral da página |
| `--surface` | `#ffffff` | Cards, formulários, superfícies elevadas |
| `--border` | `#e2e8f0` | Bordas de tabelas, divisores, inputs |
| `--text` | `#1e293b` | Texto principal |
| `--text-muted` | `#64748b` | Labels, metadados, rodapé |
| `--success` | `#16a34a` | Alertas de sucesso, células de resultado |
| `--warning` | `#d97706` | Alertas de atenção, células pivô |
| `--danger` | `#dc2626` | Erros |

**Gradiente hero:** `linear-gradient(135deg, #1a56db 0%, #0ea5e9 100%)`

---

## Tipografia

| Elemento | Família | Tamanho | Peso |
|---|---|---|---|
| Body | `'Segoe UI', system-ui, sans-serif` | base 1rem | 400 |
| h1 | mesma | 1.9rem | 700 |
| h2 | mesma | 1.4rem | 600 |
| h3 | mesma | 1.1rem | 600 |
| Hero h1 | mesma | 2.4rem | 800 |
| Math block | `'Courier New', monospace` | 0.95rem | 400 |
| Badges / tags | mesma do body | 0.78rem | 600 |
| Navbar brand | mesma do body | 1.15rem | 700 |

**Line-height:** 1.6 no body.
**Sem Google Fonts** — usa apenas fontes do sistema para carregamento zero.

---

## Border Radius e Sombras

- `--radius: 8px` — aplicado em cards, botões, inputs, badges
- `--shadow: 0 1px 4px rgba(0,0,0,.08)` — sombra sutil em cards
- Navbar: `box-shadow: 0 2px 8px rgba(0,0,0,.18)` — separação do conteúdo

---

## Estrutura de Componentes

### Navbar
- Fundo `--primary`, sticky no topo, z-index 100
- Links com hover `rgba(255,255,255,.18)` e `border-radius: 8px`
- Brand (logo texto) com `margin-right: auto` para empurrar links à direita

### Hero
- Gradiente diagonal 135°, texto branco centralizado
- Cards de navegação translúcidos (`rgba(255,255,255,.15)`) com hover translateY(-3px)
- Padding: 4rem desktop, reduz progressivamente no mobile

### Layout Principal
- `max-width: 900px`, centralizado, padding lateral 1.2rem
- Sem grid complexo — fluxo linear de seções

### Cards
- Fundo branco, borda `--border`, border-radius 8px, sombra suave
- Título em `--primary`

### Math Block (blocos de código CPLEX / fórmulas)
- Fundo `#f1f5f9`, borda esquerda 4px sólida `--primary`
- Font monospace, overflow-x auto para fórmulas longas
- Border-radius apenas nos cantos direitos (0 8px 8px 0)

### Alertas
| Tipo | Fundo | Borda esquerda |
|---|---|---|
| `.alert-info` | `#eff6ff` | `--primary` azul |
| `.alert-success` | `#f0fdf4` | `--success` verde |
| `.alert-warning` | `#fffbeb` | `--warning` âmbar |

### Tableau (tabelas Simplex)
- Header: fundo `--primary`, texto branco
- Linhas pares: `#f1f5f9`
- `.pivot`: `#fef3c7` (âmbar claro) — elemento pivô
- `.basis`: `#eff6ff` (azul claro) — variável básica
- `.result`: `#f0fdf4` (verde claro) — resultado ótimo

### Badges / Tags
| Classe | Fundo | Texto |
|---|---|---|
| `.badge-blue` | `#dbeafe` | `#1e40af` |
| `.badge-green` | `#dcfce7` | `#15803d` |
| `.badge-orange` | `#ffedd5` | `#c2410c` |

### Botões
- `.btn-primary`: fundo `--primary`, texto branco, hover `--primary-dk`
- `.btn-outline`: transparente, borda 2px `--primary`, hover inverte
- `.btn-sm`: padding reduzido para ações secundárias
- Todos: `transform: scale(.97)` no active

### Phases (seções de exercício)
- `.phase`: container com `.phase-head` (linha horizontal + tag colorida + título)
- `.phase-tag`: número/letra em `--primary`, destaque lateral
- `.phase-body`: conteúdo da fase com padding interno

### Steps (passos numerados)
- Círculo colorido (`--primary`) com número branco, 2rem × 2rem
- Flex row com gap 1rem entre círculo e texto

---

## Responsividade

| Breakpoint | Ajuste |
|---|---|
| `max-width: 900px` (exercicios.html) | Sidebar estreita 170px, metadados ocultos |
| `max-width: 768px` (style.css) | Hero padding reduz, hero-cards menores |
| `max-width: 640px` (exercicios.html) | Sidebar oculta, select aparece, grids 1 coluna, tabelas scroll horizontal |
| `max-width: 600px` (style.css) | Navbar compacta, fontes reduzidas, math-block scroll, botões menores |

---

## Convenções de Nomenclatura CSS

- BEM simplificado: `.componente`, `.componente-elemento`, `.componente--modificador`
- Variáveis CSS no `:root` para todos os tokens de cor
- Classes utilitárias simples (`.btn-sm`, `.badge-blue`) sem frameworks externos
- Comentários de seção com `/* ── Nome ── */`

---

## Tom Visual Geral

Inspiração: dashboards SaaS (Notion, Linear, Vercel). Sóbrio, profissional, com toques de cor apenas onde há hierarquia ou destaque. Sem gradientes excessivos fora do hero. Contraste alto para leitura prolongada de conteúdo matemático.
