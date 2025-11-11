@echo off
REM ========================================
REM Script de Inicialização do RagnaLobo
REM ========================================

echo.
echo ========================================
echo    RagnaLobo - Servidor Ragnarok Online
echo ========================================
echo.

REM Defina o caminho do servidor aqui
set SERVER_PATH=C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11

REM Verifica se o caminho existe
if not exist "%SERVER_PATH%" (
    echo ERRO: Pasta do servidor nao encontrada!
    echo Caminho esperado: %SERVER_PATH%
    echo.
    pause
    exit /b 1
)

echo [1/4] Iniciando Login Server...
start "RagnaLobo - Login Server" /D "%SERVER_PATH%" "%SERVER_PATH%\login-server.exe"
timeout /t 2 /nobreak > nul

echo [2/4] Iniciando Char Server...
start "RagnaLobo - Char Server" /D "%SERVER_PATH%" "%SERVER_PATH%\char-server.exe"
timeout /t 2 /nobreak > nul

echo [3/4] Iniciando Map Server...
start "RagnaLobo - Map Server" /D "%SERVER_PATH%" "%SERVER_PATH%\map-server.exe"
timeout /t 2 /nobreak > nul

echo [4/4] Todos os servidores foram iniciados!
echo.
echo ========================================
echo   Servidores em execucao:
echo   - Login Server (porta 6900)
echo   - Char Server (porta 6121)
echo   - Map Server (porta 5121)
echo ========================================
echo.
echo Painel de Controle: http://localhost/
echo.
echo Pressione qualquer tecla para fechar esta janela...
pause > nul
