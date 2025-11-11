# 📦 RagnaLobo - Índice Completo de Arquivos e Scripts

## 📅 Data de Criação
11 de novembro de 2025

---

## 🎯 Scripts de Instalação e Configuração

### 1. install-all.bat
**Função:** Script mestre que executa toda a configuração inicial  
**Uso:**
```bash
install-all.bat
```
**O que faz:**
- Executa `setup-database.bat`
- Executa `configure-rathena.bat`
- Exibe instruções para próximos passos

---

### 2. setup-database.bat
**Função:** Cria e configura o banco de dados MySQL  
**Uso:**
```bash
setup-database.bat
```
**O que faz:**
- Verifica conexão com MySQL
- Cria banco de dados `rathena`
- Configura permissões do usuário `root`

**Credenciais usadas:**
- Host: 127.0.0.1
- Usuário: root
- Senha: 1234
- Database: rathena

---

### 3. configure-rathena.bat
**Função:** Configura automaticamente os arquivos .conf do servidor rAthena  
**Uso:**
```bash
configure-rathena.bat
```
**O que faz:**
- Cria backup dos arquivos originais
- Atualiza `inter_athena.conf`
- Atualiza `char_athena.conf`
- Atualiza `map_athena.conf`
- Atualiza `login_athena.conf`

**Arquivos modificados:**
- `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\inter_athena.conf`
- `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\char_athena.conf`
- `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\map_athena.conf`
- `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\login_athena.conf`

---

### 4. configure-rathena.ps1
**Função:** Versão PowerShell do script de configuração  
**Uso:**
```powershell
powershell -ExecutionPolicy Bypass -File configure-rathena.ps1
```
**Vantagens:**
- Melhor tratamento de erros
- Output colorido
- Backup com timestamp
- Mais recursos do PowerShell

---

### 5. import-sql.bat
**Função:** Importa os schemas SQL do rAthena para o banco de dados  
**Uso:**
```bash
import-sql.bat
```
**O que faz:**
- Importa `main.sql` (obrigatório)
- Importa `item_db.sql` e `item_db_re.sql`
- Importa `mob_db.sql` e `mob_db_re.sql`
- Importa `logs.sql`
- Importa `item_cash_db.sql` (se existir)

**Requer:** Banco de dados `rathena` já criado

---

### 6. start-servers.bat
**Função:** Inicia todos os servidores do rAthena  
**Uso:**
```bash
start-servers.bat
```
**O que faz:**
- Inicia Login Server (porta 6900)
- Aguarda 2 segundos
- Inicia Char Server (porta 6121)
- Aguarda 2 segundos
- Inicia Map Server (porta 5121)

---

### 7. stop-servers.bat
**Função:** Encerra todos os servidores em execução  
**Uso:**
```bash
stop-servers.bat
```
**O que faz:**
- Encerra Login Server
- Encerra Char Server
- Encerra Map Server

---

## 📚 Documentação

### 1. README.md
**Conteúdo:**
- Visão geral do projeto
- Status das funcionalidades
- Guia de instalação rápida
- Estrutura do projeto
- Referências

---

### 2. GUIA-RAPIDO.md
**Conteúdo:**
- Credenciais do banco de dados
- Comandos de início rápido
- Tabela de arquivos importantes
- Descrição dos scripts
- Checklist de instalação
- Solução de problemas comuns

---

### 3. CONFIGURACAO.md
**Conteúdo:**
- Configuração detalhada do FluxCP
- Alterações realizadas nos arquivos
- Estrutura de diretórios
- Pré-requisitos e instalação
- Configuração do servidor web
- NPCs incluídos
- Segurança

---

### 4. CONFIGURACAO-SERVIDOR-RATHENA.md
**Conteúdo:**
- Guia de configuração dos arquivos .conf
- Exemplos de configuração
- Scripts SQL necessários
- Como iniciar os servidores
- Verificação de status
- Solução de problemas

---

### 5. CONFIGURACAO-MANUAL-RATHENA.md
**Conteúdo:**
- Instruções para configuração manual
- Conteúdo exato de cada arquivo .conf
- Templates de configuração
- Checklist de verificação
- Dicas de edição de arquivos
- Solução de problemas específicos

---

### 6. ALTERACOES.md
**Conteúdo:**
- Registro de todas as alterações
- Arquivos modificados
- Novos arquivos criados
- Configuração padrão
- Próximos passos
- Referências aos arquivos de configuração do servidor

---

### 7. INDICE-COMPLETO.md (este arquivo)
**Conteúdo:**
- Lista completa de todos os scripts
- Lista completa de toda a documentação
- Descrição de cada arquivo
- Como usar cada script

---

## 🗂️ Arquivos de Configuração

### 1. config/servers.php
**Função:** Configuração de servidores e banco de dados do FluxCP  
**Configurações importantes:**
- DbConfig (banco principal)
- LogsDbConfig (banco de logs)
- LoginServer (IP e porta)
- CharMapServers (configuração dos servidores)

**Credenciais:**
```php
'Hostname'   => '127.0.0.1',
'Username'   => 'root',
'Password'   => '1234',
'Database'   => 'rathena',
```

---

### 2. config/application.php
**Função:** Configuração da aplicação FluxCP  
**Configurações importantes:**
- ServerAddress: localhost
- BaseURI: /
- DefaultLanguage: pt_br
- SiteTitle: RagnaLobo Control Panel
- InstallerPassword: ragnarok

---

### 3. .env.example
**Função:** Template de arquivo de configuração de ambiente  
**Uso:** Copie para `.env` e personalize conforme necessário

---

### 4. setup-database.sql
**Função:** Script SQL manual para criar o banco de dados  
**Uso:**
```bash
mysql -uroot -p1234 < setup-database.sql
```

---

## 📋 Fluxo de Instalação Completo

### Método 1: Automático (Recomendado)
```bash
# Passo 1: Instalação completa
install-all.bat

# Passo 2: Importar SQL files
import-sql.bat

# Passo 3: Iniciar servidores
start-servers.bat

# Passo 4: Acessar http://localhost/ e instalar FluxCP
```

### Método 2: Passo a Passo
```bash
# Passo 1: Criar banco de dados
setup-database.bat

# Passo 2: Configurar rAthena
configure-rathena.bat

# Passo 3: Importar SQL files
import-sql.bat

# Passo 4: Iniciar servidores
start-servers.bat

# Passo 5: Acessar http://localhost/ e instalar FluxCP
```

### Método 3: Manual
```bash
# Passo 1: Criar banco manualmente
mysql -uroot -p1234 -e "CREATE DATABASE rathena;"

# Passo 2: Configurar arquivos .conf manualmente
# Siga CONFIGURACAO-MANUAL-RATHENA.md

# Passo 3: Importar SQL files manualmente
cd C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\sql-files
mysql -h127.0.0.1 -uroot -p1234 rathena < main.sql
# ... outros arquivos

# Passo 4: Iniciar servidores
start-servers.bat

# Passo 5: Instalar FluxCP
# Acesse http://localhost/
```

---

## 🔍 Referência Rápida de Comandos

### Banco de Dados
```bash
# Criar banco
setup-database.bat

# Importar schemas
import-sql.bat

# Verificar conexão
mysql -h127.0.0.1 -uroot -p1234 -e "SHOW DATABASES;"

# Acessar banco
mysql -h127.0.0.1 -uroot -p1234 rathena
```

### Servidores
```bash
# Configurar
configure-rathena.bat

# Iniciar
start-servers.bat

# Parar
stop-servers.bat

# Verificar portas
netstat -an | findstr "6900 6121 5121"
```

### FluxCP
```bash
# Acessar painel
http://localhost/

# Instalador
http://localhost/?module=install

# Senha do instalador
ragnarok
```

---

## ✅ Checklist Completo

### Pré-requisitos
- [ ] MySQL/MariaDB instalado
- [ ] PHP 7.4+ instalado
- [ ] Apache/Nginx configurado
- [ ] Servidor rAthena baixado em `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11`

### Instalação do Banco
- [ ] MySQL está rodando
- [ ] Executado `setup-database.bat`
- [ ] Banco `rathena` criado com sucesso
- [ ] Executado `import-sql.bat`
- [ ] Schemas importados com sucesso

### Configuração do Servidor
- [ ] Executado `configure-rathena.bat` OU configurado manualmente
- [ ] `inter_athena.conf` configurado
- [ ] `char_athena.conf` configurado
- [ ] `map_athena.conf` configurado
- [ ] `login_athena.conf` configurado

### Inicialização
- [ ] Executado `start-servers.bat`
- [ ] Login Server iniciou (porta 6900)
- [ ] Char Server iniciou (porta 6121)
- [ ] Map Server iniciou (porta 5121)
- [ ] Todos os servidores conectados entre si

### FluxCP
- [ ] Acessado `http://localhost/`
- [ ] Instalador executado
- [ ] Tabelas FluxCP criadas no banco
- [ ] Conta de administrador criada
- [ ] Login no painel funcionando

### Cliente
- [ ] `clientinfo.xml` configurado com IP 127.0.0.1
- [ ] Cliente conecta ao servidor
- [ ] Login e criação de personagem funcionando

---

## 🆘 Solução de Problemas - Referência Rápida

### MySQL não conecta
→ Consulte: **GUIA-RAPIDO.md** seção "Problemas Comuns"

### Servidor rAthena não inicia
→ Consulte: **CONFIGURACAO-SERVIDOR-RATHENA.md** seção "Solução de Problemas"

### FluxCP não instala
→ Consulte: **CONFIGURACAO.md** seção "Resolução de Problemas"

### Configuração manual necessária
→ Consulte: **CONFIGURACAO-MANUAL-RATHENA.md**

---

## 📞 Suporte e Documentação

### Documentação por Assunto

| Preciso de... | Consulte... |
|---------------|-------------|
| Instalar tudo rapidamente | **GUIA-RAPIDO.md** |
| Configurar FluxCP | **CONFIGURACAO.md** |
| Configurar servidor rAthena | **CONFIGURACAO-SERVIDOR-RATHENA.md** |
| Editar arquivos .conf manualmente | **CONFIGURACAO-MANUAL-RATHENA.md** |
| Ver histórico de mudanças | **ALTERACOES.md** |
| Entender a estrutura | **README.md** |
| Referência de todos os arquivos | **INDICE-COMPLETO.md** (este) |

---

## 🔗 Links Úteis

- **GitHub do rAthena**: https://github.com/rathena/rathena
- **GitHub do FluxCP**: https://github.com/rathena/FluxCP
- **Fórum rAthena**: https://rathena.org/
- **Documentação rAthena**: https://github.com/rathena/rathena/wiki

---

**Última atualização**: 11 de novembro de 2025  
**Versão**: 1.0  
**Projeto**: RagnaLobo  
**Tipo**: Servidor Ragnarok Online (rAthena)
