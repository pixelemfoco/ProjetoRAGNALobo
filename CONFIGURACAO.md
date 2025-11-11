# RagnaLobo - Guia de Configuração

## 📋 Visão Geral

Este projeto é um FluxCP (Flux Control Panel) configurado para funcionar com o servidor rAthena localizado em `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11`.

## 🔧 Alterações Realizadas

### 1. Configuração de Servidores (`config/servers.php`)

#### Alterações de Banco de Dados:
- **Hostname**: Alterado de `198.50.143.30` para `127.0.0.1` (servidor local)
- **Socket**: Alterado de `/tmp/mysql.sock` para `null` (compatível com Windows)
- **Password**: Removida a senha antiga (ajuste conforme sua configuração MySQL)
- **ServerName**: Alterado de `FluxRO` para `RagnaLobo`

#### Alterações de Servidores de Jogo:
- **Login Server**: IP alterado para `127.0.0.1` (localhost)
- **Char Server**: IP alterado para `127.0.0.1`, porta mantida em `6121`
- **Map Server**: IP alterado para `127.0.0.1`, porta mantida em `5121`

### 2. Configuração da Aplicação (`config/application.php`)

#### Alterações Principais:
- **BaseURI**: Alterado de `fluxcp` para `/` (raiz do servidor web)
- **DefaultLanguage**: Alterado de `en_us` para `pt_br`
- **SiteTitle**: Alterado para `RagnaLobo Control Panel`
- **RequireOwnership**: Desabilitado (`false`) para compatibilidade com Windows
- **MailerFromAddress**: Alterado para `noreply@ragnalobo.local`
- **MailerFromName**: Alterado para `RagnaLobo`

## 📁 Estrutura de Diretórios

```
C:\Users\mathe\OneDrive\Documentos\RagnaLobo\
├── 11\                          # Pasta do servidor rAthena e cliente
│   ├── login-server.exe         # Servidor de login
│   ├── char-server.exe          # Servidor de personagens
│   ├── map-server.exe           # Servidor de mapas
│   └── [outros arquivos do servidor]
│
└── ProjetoRAGNALobo\            # FluxCP (este projeto)
    ├── config\                  # Arquivos de configuração
    ├── modules\                 # Módulos do painel
    ├── themes\                  # Temas visuais
    └── data\                    # Dados e logs
```

## ⚙️ Configuração Necessária

### Pré-requisitos:
1. **Servidor Web**: Apache ou Nginx com PHP 5.2+ (recomendado PHP 7.4)
2. **MySQL/MariaDB**: Versão 5.0+
3. **Extensões PHP**: PDO, PDO_MYSQL, GD2 (opcional para CAPTCHA)

### Passos de Instalação:

1. **Configure o Banco de Dados**:
   ```sql
   CREATE DATABASE rathena;
   ```

2. **Ajuste as Credenciais**:
   - Edite `config/servers.php` e preencha:
     - `Username`: root
     - `Password`: 1234
     - `Database`: rathena

3. **Configure o Servidor Web**:
   - Aponte o DocumentRoot para a pasta do projeto
   - Exemplo Apache (httpd.conf):
     ```apache
     DocumentRoot "C:/Users/mathe/OneDrive/Documentos/RagnaLobo/ProjetoRAGNALobo"
     <Directory "C:/Users/mathe/OneDrive/Documentos/RagnaLobo/ProjetoRAGNALobo">
         Options Indexes FollowSymLinks
         AllowOverride All
         Require all granted
     </Directory>
     ```

4. **Execute o Instalador**:
   - Acesse: `http://localhost/`
   - Siga o assistente de instalação
   - Use a senha do instalador: `ragnarok`

5. **Configure o Servidor rAthena**:
   - Certifique-se que os arquivos de configuração em `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf` apontam para:
     - IP do servidor: `127.0.0.1`
     - Banco de dados: mesmo configurado no FluxCP

## 🗄️ Configuração do Banco de Dados no rAthena

Os arquivos de configuração do servidor geralmente estão em:
```
C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\conf\
├── char-server.conf
├── map-server.conf
└── login-server.conf
```

### Exemplo de configuração (char-server.conf):
```conf
// Server Communication username and password.
userid: s1
passwd: p1

// Server name
server_name: RagnaLobo

// Wisp name for server
wisp_server_name: Server

// Login Server IP
login_ip: 127.0.0.1
login_port: 6900

// Character Server IP
char_ip: 127.0.0.1
bind_ip: 127.0.0.1
char_port: 6121

// MySQL configurations
char_server_id: root
char_server_pw: 1234
char_server_db: rathena
char_server_ip: 127.0.0.1
char_server_port: 3306
```

## 🔐 Segurança

### Credenciais Padrão:
- **Instalador**: `ragnarok` (altere após instalação!)
- **MySQL**: Configure uma senha forte
- **Admin do Painel**: Será criado durante a instalação

### Recomendações:
1. Altere a senha do instalador em `config/application.php`
2. Configure permissões adequadas na pasta `data/`
3. Em produção, ative `RequireOwnership` se estiver em Linux
4. Use senhas fortes para contas de administrador

## 📝 NPCs Incluídos

O projeto inclui NPCs prontos em `data/npc/`:
- **web_commands.txt**: Permite executar comandos do painel web
- **support_cmd.txt**: Sistema de tickets de suporte
- **DonationNPC.txt**: NPC para doações
- **PeakNPC.txt**: Rastreamento de pico de jogadores

### Para usar os NPCs:
1. Copie os arquivos para a pasta de scripts do servidor:
   ```
   C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\npc\custom\
   ```

2. Adicione no `scripts_custom.conf`:
   ```conf
   npc: npc/custom/web_commands.txt
   npc: npc/custom/support_cmd.txt
   ```

## 🌐 URLs de Acesso

- **Painel de Controle**: `http://localhost/`
- **Instalador**: `http://localhost/?module=install`
- **Login**: `http://localhost/?module=account&action=login`
- **Registro**: `http://localhost/?module=account&action=create`

## 🐛 Resolução de Problemas

### Erro de Conexão com Banco de Dados:
- Verifique se o MySQL está rodando
- Confirme as credenciais em `config/servers.php`
- Teste a conexão: `mysql -u root -p`

### Permissões de Arquivo (Windows):
- Execute o servidor web como Administrador
- Garanta que a pasta `data/` é gravável

### Servidores Offline:
- Verifique se login/char/map servers estão executando
- Confirme as portas (6900, 6121, 5121) não estão bloqueadas pelo firewall
- Revise os logs em `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11\log\`

## 📚 Documentação Adicional

- **FluxCP**: https://github.com/rathena/FluxCP
- **rAthena**: https://rathena.org/
- **Suporte**: Verifique `doc/` para documentação de temas e idiomas

## 🔄 Atualizações Futuras

Para atualizar o FluxCP:
1. Faça backup dos arquivos de configuração (`config/`)
2. Faça backup do banco de dados
3. Baixe a versão mais recente
4. Restaure suas configurações personalizadas
5. Execute o instalador para atualizar o schema do banco

---

**Última atualização**: 11 de novembro de 2025
**Versão do FluxCP**: rAthena Fork
**Servidor**: RagnaLobo
