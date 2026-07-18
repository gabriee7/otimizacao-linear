# ============================================================
#  update-git.ps1  —  Atualiza o repositório
#  Execute: clique direito → "Executar com PowerShell"
# ============================================================

$ErrorActionPreference = "Stop"
$destino = "$env:USERPROFILE\Desktop\otimizacao-linear"
$origem  = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host ""
Write-Host "=== Atualizar: Otimizacao Linear ===" -ForegroundColor Cyan

if (-not (Test-Path "$destino\.git")) {
    Write-Host "[ERRO] Repositório não encontrado em $destino" -ForegroundColor Red
    Read-Host "Pressione Enter para fechar"; exit 1
}

Write-Host "`n[1/4] Copiando arquivos..." -ForegroundColor Yellow
$arquivos = @("index.html","teoria.html","exercicios.html","solver.html","grafico.html","guia-prova-final.html","style.css","DEPLOY.md")
foreach ($f in $arquivos) {
    Copy-Item "$origem\$f" "$destino\$f" -Force
    Write-Host "      $f" -ForegroundColor Gray
}

Write-Host "[2/4] Sincronizando com GitHub (pull --rebase)..." -ForegroundColor Yellow
Set-Location $destino
git pull --rebase origin main

Write-Host "[3/4] Commitando..." -ForegroundColor Yellow
git add .
git commit -m "feat: Q10 reescrito com passos romanos e tabelas E-SE + Q12-Q17 completos

- Q12: B&B misto MAX, x1=3 x2=0 x3=1/3, z=58/3
- Q13: B&B inteiro puro MAX, x1=2 x2=2, z*=4
- Q14: B&B MIN com igualdade, x1=7 x2=5, z*=5.3
- Q15: PMM01M formato CPLEX (5 produtos, 3 malas, orcamento)
- Q16: 5 aplicacoes reais de PI (mochila, localizacao, p-medianas, TSP, VRPTW)
- Q17: Set Covering formato CPLEX (antenas, z*=2 antenas L4+L5)
- JS sections array atualizado para q1-q17"

Write-Host "[4/4] Fazendo push..." -ForegroundColor Yellow
git push

Write-Host ""
Write-Host "=== Concluido! ===" -ForegroundColor Green
Write-Host "Site: https://gabriee7.github.io/otimizacao-linear/exercicios.html" -ForegroundColor Cyan
Write-Host ""
Read-Host "Pressione Enter para fechar"
