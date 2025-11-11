# 🔧 Guia de Configuração Manual do Servidor rAthena

## 📁 Localização dos Arquivos
```
C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\
```

## 🚀 Configuração Automática (Recomendado)

### Opção 1: Script Batch
```bash
configure-rathena.bat
```

### Opção 2: Script PowerShell
```powershell
powershell -ExecutionPolicy Bypass -File configure-rathena.ps1
```

## ✏️ Configuração Manual

Se preferir editar manualmente, siga as instruções abaixo:

---

## 📝 1. inter_athena.conf

**Arquivo:** `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\inter_athena.conf`

### Login Server Database
Encontre e altere as seguintes linhas:

```conf
// MySQL Login server
login_server_ip: 127.0.0.1
login_server_port: 3306
login_server_id: root
login_server_pw: 1234
login_server_db: rathena
```

### Character Server Database
```conf
// MySQL Character server
char_server_ip: 127.0.0.1
char_server_port: 3306
char_server_id: root
char_server_pw: 1234
char_server_db: rathena
```

### Map Server Database
```conf
// MySQL Map server
map_server_ip: 127.0.0.1
map_server_port: 3306
map_server_id: root
map_server_pw: 1234
map_server_db: rathena
```

### Log Database
```conf
// MySQL Log Database
log_db_ip: 127.0.0.1
log_db_port: 3306
log_db_id: root
log_db_pw: 1234
log_db_db: rathena
```

---

## 📝 2. char_athena.conf

**Arquivo:** `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\char_athena.conf`

```conf
// Server name
server_name: RagnaLobo

// Wisp name for server
wisp_server_name: Server

// Login Server IP
login_ip: 127.0.0.1
login_port: 6900

// Character Server IP
char_ip: 127.0.0.1
char_port: 6121

// Bind IP (opcional, pode comentar)
// bind_ip: 127.0.0.1

// Server Communication username and password
userid: s1
passwd: p1
```

---

## 📝 3. map_athena.conf

**Arquivo:** `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\map_athena.conf`

```conf
// Character Server IP
char_ip: 127.0.0.1
char_port: 6121

// Map Server IP
map_ip: 127.0.0.1
map_port: 5121

// Bind IP (opcional, pode comentar)
// bind_ip: 127.0.0.1

// Server Communication username and password
userid: s1
passwd: p1
```

---

## 📝 4. login_athena.conf

**Arquivo:** `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\login_athena.conf`

```conf
// Login Server Port
login_port: 6900

// Bind IP (opcional, pode comentar)
// bind_ip: 127.0.0.1

// Whether to use MD5 hashed passwords
use_MD5_passwords: no

// Can you use _M/_F to make new accounts on the server?
new_account: yes

// Account registration flood protection
allowed_regs: 3
time_allowed: 10
```

---

## 📝 5. Outros Arquivos Importantes

### import/inter_conf.txt
Se este arquivo existir, verifique se tem as mesmas configurações do `inter_athena.conf`.

### subnet_athena.conf (se existir)
```conf
// Configuração de subnet para LAN
subnet: 127.0.0.1:255.255.255.0:127.0.0.1
```

---

## 🔍 Verificação das Configurações

Após configurar, use este checklist:

### Checklist inter_athena.conf
- [ ] `login_server_ip: 127.0.0.1`
- [ ] `login_server_id: root`
- [ ] `login_server_pw: 1234`
- [ ] `login_server_db: rathena`
- [ ] `char_server_ip: 127.0.0.1`
- [ ] `char_server_id: root`
- [ ] `char_server_pw: 1234`
- [ ] `char_server_db: rathena`
- [ ] `map_server_ip: 127.0.0.1`
- [ ] `map_server_id: root`
- [ ] `map_server_pw: 1234`
- [ ] `map_server_db: rathena`
- [ ] `log_db_ip: 127.0.0.1`
- [ ] `log_db_id: root`
- [ ] `log_db_pw: 1234`
- [ ] `log_db_db: rathena`

### Checklist char_athena.conf
- [ ] `server_name: RagnaLobo`
- [ ] `login_ip: 127.0.0.1`
- [ ] `login_port: 6900`
- [ ] `char_ip: 127.0.0.1`
- [ ] `char_port: 6121`
- [ ] `userid: s1`
- [ ] `passwd: p1`

### Checklist map_athena.conf
- [ ] `char_ip: 127.0.0.1`
- [ ] `char_port: 6121`
- [ ] `map_ip: 127.0.0.1`
- [ ] `map_port: 5121`
- [ ] `userid: s1`
- [ ] `passwd: p1`

### Checklist login_athena.conf
- [ ] `login_port: 6900`
- [ ] `use_MD5_passwords: no`
- [ ] `new_account: yes`

---

## 📋 Template de Configuração Rápida

Use este template para copiar e colar rapidamente:

```conf
# Para inter_athena.conf
login_server_ip: 127.0.0.1
login_server_port: 3306
login_server_id: root
login_server_pw: 1234
login_server_db: rathena

char_server_ip: 127.0.0.1
char_server_port: 3306
char_server_id: root
char_server_pw: 1234
char_server_db: rathena

map_server_ip: 127.0.0.1
map_server_port: 3306
map_server_id: root
map_server_pw: 1234
map_server_db: rathena

log_db_ip: 127.0.0.1
log_db_port: 3306
log_db_id: root
log_db_pw: 1234
log_db_db: rathena

# Para char_athena.conf
server_name: RagnaLobo
login_ip: 127.0.0.1
login_port: 6900
char_ip: 127.0.0.1
char_port: 6121
userid: s1
passwd: p1

# Para map_athena.conf
char_ip: 127.0.0.1
char_port: 6121
map_ip: 127.0.0.1
map_port: 5121
userid: s1
passwd: p1

# Para login_athena.conf
login_port: 6900
use_MD5_passwords: no
new_account: yes
```

---

## 🔒 Importante

### Backup Antes de Editar
Sempre faça backup dos arquivos originais:
```bash
copy inter_athena.conf inter_athena.conf.backup
copy char_athena.conf char_athena.conf.backup
copy map_athena.conf map_athena.conf.backup
copy login_athena.conf login_athena.conf.backup
```

### Codificação do Arquivo
- Use um editor que suporte UTF-8 (Notepad++, VS Code)
- NÃO use Bloco de Notas do Windows (pode adicionar BOM)

### Fim de Linha
- Certifique-se que os arquivos usam quebras de linha Unix (LF) ou Windows (CRLF)

---

## 🆘 Solução de Problemas

### Servidor não conecta ao MySQL
1. Verifique se o MySQL está rodando
2. Teste a conexão: `mysql -h127.0.0.1 -uroot -p1234 rathena`
3. Verifique as credenciais em `inter_athena.conf`

### Char/Map não conecta ao Login
1. Verifique se `userid` e `passwd` são iguais em todos os arquivos
2. Confirme os IPs: `login_ip`, `char_ip`, `map_ip`
3. Verifique os logs do servidor

### Erro de sintaxe no arquivo .conf
1. Verifique se não há espaços extras
2. Confirme que usou `:` (dois pontos) após o nome da configuração
3. Não use aspas nos valores (exceto se especificado)

---

## 📚 Arquivos Relacionados

- [GUIA-RAPIDO.md](GUIA-RAPIDO.md) - Referência rápida
- [CONFIGURACAO.md](CONFIGURACAO.md) - Configuração do FluxCP
- [configure-rathena.bat](configure-rathena.bat) - Script automatizado
- [configure-rathena.ps1](configure-rathena.ps1) - Script PowerShell

---

**Última atualização**: 11 de novembro de 2025  
**Versão**: 1.0
