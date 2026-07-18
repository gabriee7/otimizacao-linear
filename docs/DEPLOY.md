# Deploy no GitHub Pages

## Pré-requisitos

- Git instalado: https://git-scm.com/downloads
- Conta no GitHub: https://github.com

---

## Passo 1 — Inicializar o repositório local

Abra o terminal na pasta do projeto e execute:

```bash
git init
git add .
git commit -m "feat: site inicial de Otimização Linear"
```

---

## Passo 2 — Criar repositório no GitHub

1. Acesse https://github.com/new
2. Nomeie o repositório (ex: `otimizacao-linear`)
3. Deixe como **Public**
4. **Não** marque "Add a README file"
5. Clique em **Create repository**

---

## Passo 3 — Conectar e fazer push

Substitua `SEU_USUARIO` pelo seu nome de usuário do GitHub:

```bash
git remote add origin https://github.com/SEU_USUARIO/otimizacao-linear.git
git branch -M main
git push -u origin main
```

---

## Passo 4 — Ativar o GitHub Pages

1. No repositório, vá em **Settings → Pages**
2. Em **Source**, selecione `Deploy from a branch`
3. Em **Branch**, selecione `main` e pasta `/ (root)`
4. Clique em **Save**

Aguarde ~1 minuto. O site estará disponível em:

```
https://SEU_USUARIO.github.io/otimizacao-linear/
```

---

## Atualizar o site no futuro

Sempre que fizer alterações nos arquivos:

```bash
git add .
git commit -m "feat: novo exercício"
git push
```

O GitHub Pages atualiza automaticamente após o push.

---

## Estrutura do projeto

```
otimizacao-linear/
├── index.html                    ← Página inicial (precisa ficar na raiz p/ o GitHub Pages)
├── pages/
│   ├── teoria.html                   ← Teoria completa (Simplex, Dualidade, etc.)
│   ├── exercicios.html               ← Exercícios resolvidos (estilo detalhado)
│   ├── solver.html                   ← Solver interativo Simplex
│   ├── grafico.html                  ← Visualização gráfica 2D
│   └── guia-prova-final.html         ← Guia de prova final (Big-M, Duas Fases, sensibilidade)
├── assets/css/style.css          ← Estilos do site principal
├── scripts/                      ← Scripts .ps1 de apoio (uso pessoal, não afetam o Pages)
├── docs/
│   ├── DEPLOY.md                     ← Este arquivo
│   └── design-prompt.md              ← Especificação de design
└── materiais/                    ← Material de estudo pessoal (gitignored, não publicado)
```
