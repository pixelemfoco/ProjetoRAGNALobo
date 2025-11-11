# 🚀 Guia Rápido - RagnaLobo

## 📋 Configurações do Banco de Dados

```
Host:     127.0.0.1
Porta:    3306
Usuário:  root
Senha:    1234
Database: rathena
```

## ⚡ Início Rápido

### 1. Configurar Banco de Dados
```bash
# Executar o script de setup
setup-database.bat
```

### 2. Configurar Servidor rAthena
```bash
# Configurar automaticamente os arquivos .conf
configure-rathena.bat
```

### 3. Iniciar Servidores
```bash
# Iniciar todos os servidores de uma vez
start-servers.bat
```

### 4. Acessar Painel
```
http://localhost/
```

### 5. Instalar FluxCP
- Senha do instalador: `ragnarok`

## 📁 Arquivos Importantes

| Arquivo | Descrição |
|---------|-----------|
| `config/servers.php` | Configuração de servidores e BD |
| `config/application.php` | Configuração da aplicação |
| `setup-database.bat` | Script de setup do banco |
| `configure-rathena.bat` | Configurar servidor rAthena |
| `configure-rathena.ps1` | Versão PowerShell do configurador |
| `start-servers.bat` | Iniciar servidores |
| `stop-servers.bat` | Parar servidores |
| `CONFIGURACAO.md` | Documentação completa FluxCP |
| `CONFIGURACAO-MANUAL-RATHENA.md` | Guia de configuração manual |

## 🔧 Scripts Batch

### setup-database.bat
Cria o banco de dados `rathena` e configura permissões automaticamente.

### configure-rathena.bat
Configura automaticamente todos os arquivos `.conf` do servidor rAthena com as credenciais corretas. Cria backup antes de alterar.

### configure-rathena.ps1
Versão PowerShell do script de configuração, com mais recursos e melhor tratamento de erros.

### start-servers.bat
Inicia os três servidores na sequência:
1. Login Server (porta 6900)
2. Char Server (porta 6121)
3. Map Server (porta 5121)

### stop-servers.bat
Encerra todos os servidores em execução.

## 🗄️ Estrutura do Servidor

```
C:\Users\mathe\OneDrive\Documentos\RagnaLobo\
├── 11\                    # Servidor e Cliente rAthena
│   ├── login-server.exe
│   ├── char-server.exe
│   ├── map-server.exe
│   └── conf\              # Arquivos de configuração do servidor
│
└── ProjetoRAGNALobo\      # FluxCP (este projeto)
    ├── config\
    ├── modules\
    ├── themes\
    └── data\
```

## ✅ Checklist de Instalação

- [ ] MySQL instalado e rodando
- [ ] Executar `setup-database.bat`
- [ ] Executar `configure-rathena.bat` (ou configurar manualmente)
- [ ] Importar scripts SQL do rAthena para o banco `rathena`
- [ ] Executar `start-servers.bat`
- [ ] Acessar `http://localhost/` e instalar FluxCP
- [ ] Testar login no jogo

## 🔐 Credenciais Padrão

### MySQL
- Usuário: `root`
- Senha: `1234`
- Database: `rathena`

### FluxCP Installer
- Senha: `ragnarok`

### Servidores (conf/inter_athena.conf)
```conf
// MySQL Login
login_server_id: root
login_server_pw: 1234
login_server_db: rathena

char_server_id: root
char_server_pw: 1234
char_server_db: rathena

map_server_id: root
map_server_pw: 1234
map_server_db: rathena
```

## 🆘 Problemas Comuns

### Erro de Conexão MySQL
```bash
# Teste a conexão manualmente
mysql -h127.0.0.1 -uroot -p1234 -e "SHOW DATABASES;"
```

### Servidores não iniciam
- Verifique se as portas 6900, 6121, 5121 estão livres
- Revise os logs em `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\log\`
- Confirme que o banco de dados está acessível

### FluxCP não conecta
- Verifique `config/servers.php`
- Confirme que as credenciais MySQL estão corretas
- Certifique-se que a pasta `data/` tem permissões de escrita

## 📚 Documentação Completa

Para informações detalhadas, consulte: [CONFIGURACAO.md](CONFIGURACAO.md)

---

**Última atualização**: 11 de novembro de 2025  
**Versão**: 1.0  
**Servidor**: RagnaLobo
