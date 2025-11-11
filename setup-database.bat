@echo off
REM ========================================
REM Script de Setup do Banco de Dados RagnaLobo
REM ========================================

echo.
echo ========================================
echo    Setup do Banco de Dados RagnaLobo
echo ========================================
echo.

REM Configurações
set DB_HOST=127.0.0.1
set DB_PORT=3306
set DB_USER=root
set DB_PASS=1234
set DB_NAME=rathena

echo Configuracoes:
echo - Host: %DB_HOST%
echo - Porta: %DB_PORT%
echo - Usuario: %DB_USER%
echo - Senha: %DB_PASS%
echo - Database: %DB_NAME%
echo.

REM Verificar se o MySQL está acessível
echo [1/3] Verificando conexao com MySQL...
mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% -e "SELECT 'Conexao OK' AS status;" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERRO: Nao foi possivel conectar ao MySQL!
    echo.
    echo Verifique:
    echo - O MySQL esta em execucao?
    echo - As credenciais estao corretas?
    echo - A senha em config/servers.php esta correta?
    echo.
    pause
    exit /b 1
)
echo OK - MySQL acessivel!
echo.

REM Criar banco de dados
echo [2/3] Criando banco de dados '%DB_NAME%'...
mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% -e "CREATE DATABASE IF NOT EXISTS %DB_NAME% DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERRO ao criar banco de dados!
    pause
    exit /b 1
)
echo OK - Banco de dados criado!
echo.

REM Conceder permissões
echo [3/3] Configurando permissoes...
mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% -e "GRANT ALL PRIVILEGES ON %DB_NAME%.* TO '%DB_USER%'@'localhost'; FLUSH PRIVILEGES;" 2>nul
echo OK - Permissoes configuradas!
echo.

echo ========================================
echo   Setup concluido com sucesso!
echo ========================================
echo.
echo Proximos passos:
echo.
echo 1. Execute os scripts SQL do rAthena:
echo    - main.sql
echo    - item_db.sql
echo    - mob_db.sql
echo    - logs.sql (se usar sistema de logs)
echo.
echo 2. Acesse http://localhost/ para instalar o FluxCP
echo.
pause
