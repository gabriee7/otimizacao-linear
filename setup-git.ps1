# ============================================================
#  setup-git.ps1  —  Configura repositório e faz push
#  Execute: clique direito → "Executar com PowerShell"
# ============================================================

$ErrorActionPreference = "Stop"

$destino = "$env:USERPROFILE\Desktop\otimizacao-linear"
$origem  = Split-Path -Parent $MyInvocation.MyCommand.Path
$remote  = "https://github.com/gabriee7/otimizacao-linear.git"

Write-Host ""
Write-Host "=== Setup: Otimizacao Linear ===" -ForegroundColor Cyan

# 1. Cria pasta no Desktop
Write-Host "`n[1/5] Criando pasta em $destino ..." -ForegroundColor Yellow
if (Test-Path $destino) {
    Remove-Item $destino -Recurse -Force
}
New-Item -ItemType Directory -Path $destino | Out-Null

# 2. Copia arquivos do projeto
Write-Host "[2/5] Copiando arquivos do projeto..." -ForegroundColor Yellow
$arquivos = @("index.html","teoria.html","exercicios.html","solver.html","grafico.html","style.css","DEPLOY.md")
foreach ($f in $arquivos) {
    Copy-Item "$origem\$f" "$destino\$f"
    Write-Host "      $f" -ForegroundColor Gray
}

# 3. Git init + commit
Write-Host "[3/5] Inicializando repositório Git..." -ForegroundColor Yellow
Set-Location $destino
git config --global user.name  "Gabriel Souza"
git config --global user.email "gabrielsouzades@gmail.com"
git config --global init.defaultBranch main
git init
git add .
git commit -m "feat: site inicial de Otimizacao Linear

- index.html: pagina inicial com navegacao
- teoria.html: teoria completa (Simplex, dualidade, analise de sensibilidade)
- exercicios.html: Q9 Dual Simplex com resolucao passo a passo (R1-R8)
- solver.html: solver interativo Simplex com tableau
- grafico.html: visualizacao grafica 2D da regiao viavel
- style.css: estilos globais"

# 4. Adiciona remote e faz push
Write-Host "[4/5] Configurando remote: $remote ..." -ForegroundColor Yellow
git remote add origin $remote
git branch -M main

Write-Host "[5/5] Fazendo push... (uma janela de login do GitHub pode abrir)" -ForegroundColor Yellow
git push -u origin main

Write-Host ""
Write-Host "=== Concluido! ===" -ForegroundColor Green
Write-Host "Projeto em: $destino" -ForegroundColor Green
Write-Host "GitHub:     https://github.com/gabriee7/otimizacao-linear" -ForegroundColor Green
Write-Host "Pages (ativar em Settings > Pages):  https://gabriee7.github.io/otimizacao-linear/" -ForegroundColor Cyan
Write-Host ""
Read-Host "Pressione Enter para fechar"
