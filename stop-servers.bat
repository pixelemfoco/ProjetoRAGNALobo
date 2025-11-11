@echo off
REM ========================================
REM Script de Encerramento do RagnaLobo
REM ========================================

echo.
echo ========================================
echo    Encerrando Servidores RagnaLobo
echo ========================================
echo.

echo Finalizando processos do servidor...

taskkill /FI "WINDOWTITLE eq RagnaLobo - Login Server" /T /F > nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] Login Server encerrado
) else (
    echo [--] Login Server nao estava em execucao
)

taskkill /FI "WINDOWTITLE eq RagnaLobo - Char Server" /T /F > nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] Char Server encerrado
) else (
    echo [--] Char Server nao estava em execucao
)

taskkill /FI "WINDOWTITLE eq RagnaLobo - Map Server" /T /F > nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [OK] Map Server encerrado
) else (
    echo [--] Map Server nao estava em execucao
)

echo.
echo ========================================
echo   Todos os servidores foram encerrados!
echo ========================================
echo.
pause
