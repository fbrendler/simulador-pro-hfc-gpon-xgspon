# Atualiza e publica os três simuladores de uma vez (rode no PowerShell do seu PC).
# Usa o login da Cloudflare que o wrangler já guardou no seu computador.
# Uso:  & "C:\APPs\Simuladores\simulador-pro-hfc-gpon-xgspon\publicar-tudo.ps1"
$ErrorActionPreference = 'Stop'
$base = Split-Path $PSScriptRoot -Parent          # C:\APPs\Simuladores
$tmp  = Join-Path $env:TEMP 'publicar-simuladores'

function Atualizar($pasta) {
  Write-Host "`n=== $pasta ===" -ForegroundColor Cyan
  Set-Location (Join-Path $base $pasta)
  git checkout main | Out-Null
  git pull
}
function Publicar($pastaSite, $projeto) {
  npx --yes wrangler@3 pages deploy $pastaSite --project-name $projeto --branch main
  if ($LASTEXITCODE -ne 0) { throw "Falhou ao publicar $projeto" }
}

# 1) PRO: só o index.html
Atualizar 'simulador-pro-hfc-gpon-xgspon'
$s = Join-Path $tmp 'pro'; Remove-Item $s -Recurse -Force -ErrorAction SilentlyContinue; New-Item -ItemType Directory $s | Out-Null
Copy-Item index.html $s
Publicar $s 'simulador-pro-hfc-gpon-xgspon'

# 2) EMTA/ONT: a versão neutra (pasta deploy), nunca a interna
Atualizar 'simulador-ONT-EMTA'
Publicar 'deploy' 'simulador-emta-ont'

# 3) Box TV: páginas + ui/ e telas/ (nunca capturas/)
Atualizar 'simulador-tv'
$s = Join-Path $tmp 'tv'; Remove-Item $s -Recurse -Force -ErrorAction SilentlyContinue; New-Item -ItemType Directory $s | Out-Null
Copy-Item box.html, hd.html, troca.html, simulador.html, index.html $s
Copy-Item ui, telas $s -Recurse
Publicar $s 'simulador-tv'

Set-Location $base
Write-Host "`nPronto: os três simuladores foram publicados." -ForegroundColor Green
