@echo off
REM ========================================
REM Script de Importacao dos SQL Files do rAthena
REM ========================================

echo.
echo ========================================
echo   Importacao de Scripts SQL - rAthena
echo ========================================
echo.

REM Configurações
set DB_HOST=127.0.0.1
set DB_PORT=3306
set DB_USER=root
set DB_PASS=1234
set DB_NAME=rathena
set SQL_PATH=C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\sql-files

echo Configuracoes:
echo - Host: %DB_HOST%
echo - Porta: %DB_PORT%
echo - Usuario: %DB_USER%
echo - Database: %DB_NAME%
echo - Pasta SQL: %SQL_PATH%
echo.

REM Verificar se a pasta de SQL files existe
if not exist "%SQL_PATH%" (
    echo.
    echo ERRO: Pasta de SQL files nao encontrada!
    echo Caminho esperado: %SQL_PATH%
    echo.
    echo Por favor, verifique se o servidor rAthena esta instalado.
    pause
    exit /b 1
)

echo ATENCAO: Este script ira importar os schemas do rAthena.
echo Certifique-se de que o banco de dados 'rathena' esta vazio!
echo.
pause

echo.
echo Importando arquivos SQL...
echo.

REM Importar main.sql (schema principal)
echo [1/7] Importando main.sql...
mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% %DB_NAME% < "%SQL_PATH%\main.sql" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERRO ao importar main.sql
    pause
    exit /b 1
)
echo OK
echo.

REM Importar item_db.sql
echo [2/7] Importando item_db.sql...
if exist "%SQL_PATH%\item_db.sql" (
    mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% %DB_NAME% < "%SQL_PATH%\item_db.sql" 2>nul
    echo OK
) else (
    echo Arquivo nao encontrado, pulando...
)
echo.

REM Importar item_db_re.sql (Renewal)
echo [3/7] Importando item_db_re.sql...
if exist "%SQL_PATH%\item_db_re.sql" (
    mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% %DB_NAME% < "%SQL_PATH%\item_db_re.sql" 2>nul
    echo OK
) else (
    echo Arquivo nao encontrado, pulando...
)
echo.

REM Importar mob_db.sql
echo [4/7] Importando mob_db.sql...
if exist "%SQL_PATH%\mob_db.sql" (
    mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% %DB_NAME% < "%SQL_PATH%\mob_db.sql" 2>nul
    echo OK
) else (
    echo Arquivo nao encontrado, pulando...
)
echo.

REM Importar mob_db_re.sql (Renewal)
echo [5/7] Importando mob_db_re.sql...
if exist "%SQL_PATH%\mob_db_re.sql" (
    mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% %DB_NAME% < "%SQL_PATH%\mob_db_re.sql" 2>nul
    echo OK
) else (
    echo Arquivo nao encontrado, pulando...
)
echo.

REM Importar logs.sql
echo [6/7] Importando logs.sql...
if exist "%SQL_PATH%\logs.sql" (
    mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% %DB_NAME% < "%SQL_PATH%\logs.sql" 2>nul
    echo OK
) else (
    echo Arquivo nao encontrado, pulando...
)
echo.

REM Importar item_cash_db.sql (se existir)
echo [7/7] Importando item_cash_db.sql...
if exist "%SQL_PATH%\item_cash_db.sql" (
    mysql -h%DB_HOST% -P%DB_PORT% -u%DB_USER% -p%DB_PASS% %DB_NAME% < "%SQL_PATH%\item_cash_db.sql" 2>nul
    echo OK
) else (
    echo Arquivo nao encontrado, pulando...
)
echo.

echo ========================================
echo   Importacao concluida!
echo ========================================
echo.
echo Proximos passos:
echo 1. Execute start-servers.bat para iniciar os servidores
echo 2. Acesse http://localhost/ para instalar o FluxCP
echo.
pause
