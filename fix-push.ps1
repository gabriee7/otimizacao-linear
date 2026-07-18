# ============================================================
#  fix-push.ps1  —  Resolve conflito de histórico e faz push
#  Execute: clique direito → "Executar com PowerShell"
# ============================================================

$ErrorActionPreference = "Stop"
$destino = "$env:USERPROFILE\Desktop\otimizacao-linear"

Write-Host ""
Write-Host "=== Fix Push: Otimizacao Linear ===" -ForegroundColor Cyan

Set-Location $destino

# Puxa o remoto e faz rebase dos commits locais em cima
Write-Host "`n[1/2] Sincronizando com o GitHub (pull --rebase)..." -ForegroundColor Yellow
git pull --rebase origin main

# Agora faz push
Write-Host "[2/2] Fazendo push..." -ForegroundColor Yellow
git push

Write-Host ""
Write-Host "=== Concluido! ===" -ForegroundColor Green
Write-Host "Site: https://gabriee7.github.io/otimizacao-linear/exercicios.html" -ForegroundColor Cyan
Write-Host ""
Read-Host "Pressione Enter para fechar"
