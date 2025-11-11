-- ========================================
-- Script de Configuração do Banco de Dados RagnaLobo
-- ========================================
-- Execute este script no MySQL para configurar o banco de dados

-- Criar o banco de dados se não existir
CREATE DATABASE IF NOT EXISTS `rathena` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Criar usuário (opcional - se quiser usar um usuário específico ao invés de root)
-- CREATE USER IF NOT EXISTS 'ragnarok'@'localhost' IDENTIFIED BY '1234';

-- Conceder permissões ao usuário root
GRANT ALL PRIVILEGES ON `rathena`.* TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON `rathena`.* TO 'root'@'127.0.0.1';

-- Se você criou um usuário específico, descomente as linhas abaixo:
-- GRANT ALL PRIVILEGES ON `rathena`.* TO 'ragnarok'@'localhost';
-- GRANT ALL PRIVILEGES ON `rathena`.* TO 'ragnarok'@'127.0.0.1';

-- Aplicar as mudanças
FLUSH PRIVILEGES;

-- Selecionar o banco de dados
USE `rathena`;

-- Verificar se o banco foi criado corretamente
SELECT 'Banco de dados rathena criado com sucesso!' AS status;

-- ========================================
-- Próximos passos:
-- 1. Execute os scripts SQL do rAthena (sql-files/*.sql)
-- 2. Execute os scripts SQL do FluxCP através do instalador web
-- ========================================
