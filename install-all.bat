@echo off
REM ========================================
REM Script de Instalacao Completa RagnaLobo
REM ========================================

echo.
echo ========================================
echo    Instalacao Completa RagnaLobo
echo ========================================
echo.
echo Este script ira:
echo 1. Criar o banco de dados 'rathena'
echo 2. Configurar os arquivos do servidor rAthena
echo 3. Fornecer instrucoes para os proximos passos
echo.
echo ATENCAO: Certifique-se de que o MySQL esta rodando!
echo.
pause

REM ===================================
REM Passo 1: Configurar Banco de Dados
REM ===================================
echo.
echo ========================================
echo [PASSO 1/2] Configurando Banco de Dados
echo ========================================
echo.

call setup-database.bat

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ERRO: Falha ao configurar o banco de dados!
    echo Por favor, execute setup-database.bat manualmente.
    pause
    exit /b 1
)

REM ===================================
REM Passo 2: Configurar Servidor rAthena
REM ===================================
echo.
echo ========================================
echo [PASSO 2/2] Configurando Servidor rAthena
echo ========================================
echo.

call configure-rathena.bat

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo AVISO: Falha ao configurar automaticamente.
    echo Voce pode configurar manualmente seguindo CONFIGURACAO-MANUAL-RATHENA.md
    pause
)

REM ===================================
REM Finalizacao
REM ===================================
echo.
echo ========================================
echo   Configuracao Inicial Concluida!
echo ========================================
echo.
echo Proximos passos IMPORTANTES:
echo.
echo 1. IMPORTAR SCRIPTS SQL DO RATHENA
echo    Execute os seguintes comandos:
echo.
echo    cd C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\sql-files
echo    mysql -h127.0.0.1 -uroot -p1234 rathena ^< main.sql
echo    mysql -h127.0.0.1 -uroot -p1234 rathena ^< logs.sql
echo    mysql -h127.0.0.1 -uroot -p1234 rathena ^< item_db.sql
echo    mysql -h127.0.0.1 -uroot -p1234 rathena ^< item_db_re.sql
echo    mysql -h127.0.0.1 -uroot -p1234 rathena ^< mob_db.sql
echo    mysql -h127.0.0.1 -uroot -p1234 rathena ^< mob_db_re.sql
echo.
echo 2. INICIAR SERVIDORES
echo    Execute: start-servers.bat
echo.
echo 3. INSTALAR FLUXCP
echo    Acesse: http://localhost/
echo    Senha do instalador: ragnarok
echo.
echo 4. CONFIGURAR CLIENTE
echo    Edite clientinfo.xml com:
echo    ^<address^>127.0.0.1^</address^>
echo    ^<port^>6900^</port^>
echo.
echo ========================================
echo.
pause
