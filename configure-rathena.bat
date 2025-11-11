@echo off
REM ========================================
REM Script de Configuração Automática do Servidor rAthena
REM ========================================

echo.
echo ========================================
echo   Configuracao do Servidor rAthena
echo ========================================
echo.

set SERVER_PATH=C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11
set CONF_PATH=%SERVER_PATH%\conf

echo Configurando arquivos em: %CONF_PATH%
echo.

REM Verificar se a pasta existe
if not exist "%CONF_PATH%" (
    echo ERRO: Pasta de configuracao nao encontrada!
    echo Caminho esperado: %CONF_PATH%
    pause
    exit /b 1
)

echo Este script ira substituir os arquivos de configuracao com as seguintes credenciais:
echo.
echo   MySQL Host:     127.0.0.1
echo   MySQL Port:     3306
echo   MySQL User:     root
echo   MySQL Password: 1234
echo   Database:       rathena
echo.
echo ATENCAO: Faca backup dos arquivos antes de continuar!
echo.
pause

REM Fazer backup dos arquivos de configuração
echo.
echo [1/5] Criando backup dos arquivos de configuracao...
if not exist "%CONF_PATH%\backup" mkdir "%CONF_PATH%\backup"
copy "%CONF_PATH%\inter_athena.conf" "%CONF_PATH%\backup\inter_athena.conf.bak" >nul 2>&1
copy "%CONF_PATH%\char_athena.conf" "%CONF_PATH%\backup\char_athena.conf.bak" >nul 2>&1
copy "%CONF_PATH%\map_athena.conf" "%CONF_PATH%\backup\map_athena.conf.bak" >nul 2>&1
copy "%CONF_PATH%\login_athena.conf" "%CONF_PATH%\backup\login_athena.conf.bak" >nul 2>&1
echo OK - Backup criado em %CONF_PATH%\backup\
echo.

REM Atualizar inter_athena.conf
echo [2/5] Atualizando inter_athena.conf...
powershell -Command "(Get-Content '%CONF_PATH%\inter_athena.conf') -replace 'login_server_ip:.*', 'login_server_ip: 127.0.0.1' -replace 'login_server_port:.*', 'login_server_port: 3306' -replace 'login_server_id:.*', 'login_server_id: root' -replace 'login_server_pw:.*', 'login_server_pw: 1234' -replace 'login_server_db:.*', 'login_server_db: rathena' | Set-Content '%CONF_PATH%\inter_athena.conf'"
powershell -Command "(Get-Content '%CONF_PATH%\inter_athena.conf') -replace 'char_server_ip:.*', 'char_server_ip: 127.0.0.1' -replace 'char_server_port:.*', 'char_server_port: 3306' -replace 'char_server_id:.*', 'char_server_id: root' -replace 'char_server_pw:.*', 'char_server_pw: 1234' -replace 'char_server_db:.*', 'char_server_db: rathena' | Set-Content '%CONF_PATH%\inter_athena.conf'"
powershell -Command "(Get-Content '%CONF_PATH%\inter_athena.conf') -replace 'map_server_ip:.*', 'map_server_ip: 127.0.0.1' -replace 'map_server_port:.*', 'map_server_port: 3306' -replace 'map_server_id:.*', 'map_server_id: root' -replace 'map_server_pw:.*', 'map_server_pw: 1234' -replace 'map_server_db:.*', 'map_server_db: rathena' | Set-Content '%CONF_PATH%\inter_athena.conf'"
powershell -Command "(Get-Content '%CONF_PATH%\inter_athena.conf') -replace 'log_db_ip:.*', 'log_db_ip: 127.0.0.1' -replace 'log_db_port:.*', 'log_db_port: 3306' -replace 'log_db_id:.*', 'log_db_id: root' -replace 'log_db_pw:.*', 'log_db_pw: 1234' -replace 'log_db_db:.*', 'log_db_db: rathena' | Set-Content '%CONF_PATH%\inter_athena.conf'"
echo OK
echo.

REM Atualizar char_athena.conf
echo [3/5] Atualizando char_athena.conf...
powershell -Command "(Get-Content '%CONF_PATH%\char_athena.conf') -replace 'login_ip:.*', 'login_ip: 127.0.0.1' -replace 'char_ip:.*', 'char_ip: 127.0.0.1' -replace 'server_name:.*', 'server_name: RagnaLobo' | Set-Content '%CONF_PATH%\char_athena.conf'"
echo OK
echo.

REM Atualizar map_athena.conf
echo [4/5] Atualizando map_athena.conf...
powershell -Command "(Get-Content '%CONF_PATH%\map_athena.conf') -replace 'char_ip:.*', 'char_ip: 127.0.0.1' -replace 'map_ip:.*', 'map_ip: 127.0.0.1' | Set-Content '%CONF_PATH%\map_athena.conf'"
echo OK
echo.

REM Atualizar login_athena.conf
echo [5/5] Atualizando login_athena.conf...
powershell -Command "(Get-Content '%CONF_PATH%\login_athena.conf') -replace 'bind_ip:.*', 'bind_ip: 127.0.0.1' | Set-Content '%CONF_PATH%\login_athena.conf'"
echo OK
echo.

echo ========================================
echo   Configuracao concluida com sucesso!
echo ========================================
echo.
echo Arquivos de backup salvos em:
echo %CONF_PATH%\backup\
echo.
echo Proximos passos:
echo 1. Execute setup-database.bat para criar o banco
echo 2. Importe os scripts SQL do rAthena
echo 3. Execute start-servers.bat para iniciar
echo.
pause
