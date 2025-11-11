# Script PowerShell para Configurar o Servidor rAthena
# Execute como Administrador se necessário

$serverPath = "C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11"
$confPath = "$serverPath\conf"

Write-Host ""
Write-Host "========================================"
Write-Host "  Configuracao do Servidor rAthena"
Write-Host "========================================"
Write-Host ""

# Verificar se a pasta existe
if (-not (Test-Path $confPath)) {
    Write-Host "ERRO: Pasta de configuracao nao encontrada!" -ForegroundColor Red
    Write-Host "Caminho esperado: $confPath"
    pause
    exit 1
}

Write-Host "Configurando arquivos em: $confPath"
Write-Host ""
Write-Host "Configuracoes MySQL:"
Write-Host "  Host:     127.0.0.1"
Write-Host "  Port:     3306"
Write-Host "  User:     root"
Write-Host "  Password: 1234"
Write-Host "  Database: rathena"
Write-Host ""
Write-Host "ATENCAO: Faca backup dos arquivos antes de continuar!" -ForegroundColor Yellow
Write-Host ""
$continue = Read-Host "Deseja continuar? (S/N)"

if ($continue -ne "S" -and $continue -ne "s") {
    Write-Host "Operacao cancelada."
    exit 0
}

# Criar pasta de backup
Write-Host ""
Write-Host "[1/5] Criando backup dos arquivos de configuracao..." -ForegroundColor Cyan
$backupPath = "$confPath\backup"
if (-not (Test-Path $backupPath)) {
    New-Item -ItemType Directory -Path $backupPath | Out-Null
}

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
Copy-Item "$confPath\inter_athena.conf" "$backupPath\inter_athena.conf.$timestamp.bak" -ErrorAction SilentlyContinue
Copy-Item "$confPath\char_athena.conf" "$backupPath\char_athena.conf.$timestamp.bak" -ErrorAction SilentlyContinue
Copy-Item "$confPath\map_athena.conf" "$backupPath\map_athena.conf.$timestamp.bak" -ErrorAction SilentlyContinue
Copy-Item "$confPath\login_athena.conf" "$backupPath\login_athena.conf.$timestamp.bak" -ErrorAction SilentlyContinue

Write-Host "OK - Backup criado em $backupPath" -ForegroundColor Green
Write-Host ""

# Atualizar inter_athena.conf
Write-Host "[2/5] Atualizando inter_athena.conf..." -ForegroundColor Cyan
$file = "$confPath\inter_athena.conf"
if (Test-Path $file) {
    $content = Get-Content $file
    $content = $content -replace '^login_server_ip:.*', 'login_server_ip: 127.0.0.1'
    $content = $content -replace '^login_server_port:.*', 'login_server_port: 3306'
    $content = $content -replace '^login_server_id:.*', 'login_server_id: root'
    $content = $content -replace '^login_server_pw:.*', 'login_server_pw: 1234'
    $content = $content -replace '^login_server_db:.*', 'login_server_db: rathena'
    
    $content = $content -replace '^char_server_ip:.*', 'char_server_ip: 127.0.0.1'
    $content = $content -replace '^char_server_port:.*', 'char_server_port: 3306'
    $content = $content -replace '^char_server_id:.*', 'char_server_id: root'
    $content = $content -replace '^char_server_pw:.*', 'char_server_pw: 1234'
    $content = $content -replace '^char_server_db:.*', 'char_server_db: rathena'
    
    $content = $content -replace '^map_server_ip:.*', 'map_server_ip: 127.0.0.1'
    $content = $content -replace '^map_server_port:.*', 'map_server_port: 3306'
    $content = $content -replace '^map_server_id:.*', 'map_server_id: root'
    $content = $content -replace '^map_server_pw:.*', 'map_server_pw: 1234'
    $content = $content -replace '^map_server_db:.*', 'map_server_db: rathena'
    
    $content = $content -replace '^log_db_ip:.*', 'log_db_ip: 127.0.0.1'
    $content = $content -replace '^log_db_port:.*', 'log_db_port: 3306'
    $content = $content -replace '^log_db_id:.*', 'log_db_id: root'
    $content = $content -replace '^log_db_pw:.*', 'log_db_pw: 1234'
    $content = $content -replace '^log_db_db:.*', 'log_db_db: rathena'
    
    Set-Content $file $content
    Write-Host "OK" -ForegroundColor Green
} else {
    Write-Host "AVISO: Arquivo nao encontrado" -ForegroundColor Yellow
}
Write-Host ""

# Atualizar char_athena.conf
Write-Host "[3/5] Atualizando char_athena.conf..." -ForegroundColor Cyan
$file = "$confPath\char_athena.conf"
if (Test-Path $file) {
    $content = Get-Content $file
    $content = $content -replace '^login_ip:.*', 'login_ip: 127.0.0.1'
    $content = $content -replace '^char_ip:.*', 'char_ip: 127.0.0.1'
    $content = $content -replace '^server_name:.*', 'server_name: RagnaLobo'
    Set-Content $file $content
    Write-Host "OK" -ForegroundColor Green
} else {
    Write-Host "AVISO: Arquivo nao encontrado" -ForegroundColor Yellow
}
Write-Host ""

# Atualizar map_athena.conf
Write-Host "[4/5] Atualizando map_athena.conf..." -ForegroundColor Cyan
$file = "$confPath\map_athena.conf"
if (Test-Path $file) {
    $content = Get-Content $file
    $content = $content -replace '^char_ip:.*', 'char_ip: 127.0.0.1'
    $content = $content -replace '^map_ip:.*', 'map_ip: 127.0.0.1'
    Set-Content $file $content
    Write-Host "OK" -ForegroundColor Green
} else {
    Write-Host "AVISO: Arquivo nao encontrado" -ForegroundColor Yellow
}
Write-Host ""

# Atualizar login_athena.conf
Write-Host "[5/5] Atualizando login_athena.conf..." -ForegroundColor Cyan
$file = "$confPath\login_athena.conf"
if (Test-Path $file) {
    $content = Get-Content $file
    $content = $content -replace '^bind_ip:.*', 'bind_ip: 127.0.0.1'
    Set-Content $file $content
    Write-Host "OK" -ForegroundColor Green
} else {
    Write-Host "AVISO: Arquivo nao encontrado" -ForegroundColor Yellow
}
Write-Host ""

Write-Host "========================================"
Write-Host "  Configuracao concluida com sucesso!"
Write-Host "========================================"
Write-Host ""
Write-Host "Arquivos de backup salvos em:"
Write-Host "$backupPath"
Write-Host ""
Write-Host "Proximos passos:"
Write-Host "1. Execute setup-database.bat para criar o banco"
Write-Host "2. Importe os scripts SQL do rAthena"
Write-Host "3. Execute start-servers.bat para iniciar"
Write-Host ""
pause
