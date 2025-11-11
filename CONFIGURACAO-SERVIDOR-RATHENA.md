# Guia de Configuração do Servidor rAthena

## 📁 Localização dos Arquivos
`C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\`

## 🔧 Arquivos a Configurar

### 1. inter_athena.conf

Abra `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\inter_athena.conf` e configure:

```conf
// MySQL Login server
login_server_ip: 127.0.0.1
login_server_port: 3306
login_server_id: root
login_server_pw: 1234
login_server_db: rathena

// MySQL Character server
char_server_ip: 127.0.0.1
char_server_port: 3306
char_server_id: root
char_server_pw: 1234
char_server_db: rathena

// MySQL Map server
map_server_ip: 127.0.0.1
map_server_port: 3306
map_server_id: root
map_server_pw: 1234
map_server_db: rathena

// MySQL Log Database
log_db_ip: 127.0.0.1
log_db_port: 3306
log_db_id: root
log_db_pw: 1234
log_db_db: rathena
```

### 2. char_athena.conf

Abra `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\char_athena.conf` e configure:

```conf
// Server name
server_name: RagnaLobo

// Wisp name for server
wisp_server_name: Server

// Login Server IP
// The character server connects to the login server using this IP address.
login_ip: 127.0.0.1

// Login Server Port
login_port: 6900

// Character Server IP
// The IP address which clients will use to connect.
char_ip: 127.0.0.1

// Character Server Port
char_port: 6121

// Server Communication username and password
userid: s1
passwd: p1
```

### 3. map_athena.conf

Abra `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\map_athena.conf` e configure:

```conf
// Character Server IP
// The map server connects to the character server using this IP address.
char_ip: 127.0.0.1

// Character Server Port
char_port: 6121

// Map Server IP
// The IP address which clients will use to connect.
map_ip: 127.0.0.1

// Map Server Port
map_port: 5121

// Server Communication username and password
userid: s1
passwd: p1
```

### 4. login_athena.conf

Abra `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\login_athena.conf` e configure:

```conf
// Login Server Port
login_port: 6900

// Whether to use MD5 hashed passwords
use_MD5_passwords: no

// Can you use _M/_F to make new accounts on the server?
new_account: yes

// Account registration flood protection
// allowed_regs: Number of registrations allowed
// time_allowed: Time in seconds
allowed_regs: 3
time_allowed: 10
```

## 📝 Scripts SQL Necessários

Execute estes comandos para importar os schemas do rAthena:

```bash
# Navegue até a pasta sql-files do servidor
cd C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\sql-files

# Importe os arquivos principais
mysql -h127.0.0.1 -uroot -p1234 rathena < main.sql
mysql -h127.0.0.1 -uroot -p1234 rathena < item_db.sql
mysql -h127.0.0.1 -uroot -p1234 rathena < item_db_re.sql
mysql -h127.0.0.1 -uroot -p1234 rathena < mob_db.sql
mysql -h127.0.0.1 -uroot -p1234 rathena < mob_db_re.sql

# Importe o schema de logs (se usar sistema de logs)
mysql -h127.0.0.1 -uroot -p1234 rathena < logs.sql
```

Ou use um único comando:

```bash
cd C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\sql-files
for %f in (*.sql) do mysql -h127.0.0.1 -uroot -p1234 rathena < %f
```

## 🚀 Iniciar os Servidores

Depois de configurar tudo, use o script fornecido:

```bash
cd C:\Users\mathe\OneDrive\Documentos\RagnaLobo\ProjetoRAGNALobo
start-servers.bat
```

Ou inicie manualmente na seguinte ordem:

1. **Login Server**
   ```bash
   cd C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11
   login-server.exe
   ```

2. **Char Server** (aguarde 2 segundos)
   ```bash
   cd C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11
   char-server.exe
   ```

3. **Map Server** (aguarde 2 segundos)
   ```bash
   cd C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11
   map-server.exe
   ```

## 🔍 Verificar se os Servidores Estão Rodando

### Pelo Prompt de Comando:
```bash
netstat -an | findstr "6900 6121 5121"
```

Você deve ver algo como:
```
TCP    0.0.0.0:6900           0.0.0.0:0              LISTENING
TCP    0.0.0.0:6121           0.0.0.0:0              LISTENING
TCP    0.0.0.0:5121           0.0.0.0:0              LISTENING
```

### Pelos Logs:
Verifique os arquivos de log em:
- `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\log\login-server.log`
- `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\log\char-server.log`
- `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\log\map-server.log`

## 🐛 Solução de Problemas

### Erro: "Can't connect to MySQL server"
1. Verifique se o MySQL está rodando
2. Confirme as credenciais em `inter_athena.conf`
3. Teste a conexão: `mysql -h127.0.0.1 -uroot -p1234 -e "SHOW DATABASES;"`

### Erro: "Address already in use"
As portas 6900, 6121 ou 5121 já estão em uso. Finalize os processos ou altere as portas.

```bash
# Verificar o que está usando as portas
netstat -ano | findstr "6900 6121 5121"
```

### Char/Map Server não conecta ao Login Server
1. Verifique se `login_ip` está correto (127.0.0.1)
2. Confirme que `userid` e `passwd` são iguais em todos os arquivos
3. Verifique os logs do login-server

## 📋 Checklist Final

- [ ] MySQL instalado e rodando
- [ ] Banco de dados `rathena` criado
- [ ] Scripts SQL importados
- [ ] `inter_athena.conf` configurado
- [ ] `char_athena.conf` configurado
- [ ] `map_athena.conf` configurado
- [ ] `login_athena.conf` configurado
- [ ] Login Server iniciado com sucesso
- [ ] Char Server conectado ao Login Server
- [ ] Map Server conectado ao Char Server
- [ ] FluxCP instalado e configurado
- [ ] Cliente configurado com IP 127.0.0.1

## 🔗 Arquivos Relacionados

- [CONFIGURACAO.md](CONFIGURACAO.md) - Configuração do FluxCP
- [GUIA-RAPIDO.md](GUIA-RAPIDO.md) - Referência rápida
- [setup-database.bat](setup-database.bat) - Script de setup do BD

---

**Versão**: 1.0  
**Data**: 11 de novembro de 2025
