# ProjetoRAGNALobo
Projeto de Ragnarok Online - Site de cadastro web FluxCP

## ✅ Status do Projeto

- [x] Cadastro de usuário   
- [x] Login de usuário
- [x] Cadastro de personagem
- [x] Login de personagem
- [x] Painel de controle completo (FluxCP)
- [x] Sistema de doações
- [x] Sistema de tickets
- [x] Rankings
- [x] Informações do servidor

## 🎮 Sobre

Este é um painel de controle FluxCP configurado para o servidor RagnaLobo (rAthena).

**Servidor e Cliente**: `C:\Users\mathe\OneDrive\Documentos\RagnaLobo\11`

## 🚀 Início Rápido

### Pré-requisitos
- PHP 7.4+ com extensões PDO e PDO_MYSQL
- MySQL/MariaDB 5.0+
- Servidor Web (Apache/Nginx)
- Servidor rAthena configurado

### Instalação

1. **Configure o banco de dados**:
   ```bash
   setup-database.bat
   ```

2. **Configure o servidor rAthena**:
   ```bash
   configure-rathena.bat
   ```
   Ou manualmente seguindo [CONFIGURACAO-MANUAL-RATHENA.md](CONFIGURACAO-MANUAL-RATHENA.md)

3. **Inicie os servidores**:
   ```bash
   start-servers.bat
   ```

4. **Acesse o painel**: `http://localhost/`

5. **Execute o instalador** com a senha: `ragnarok`

### Scripts Úteis
- `setup-database.bat` - Cria e configura o banco de dados
- `configure-rathena.bat` - Configura automaticamente os arquivos do servidor rAthena
- `configure-rathena.ps1` - Versão PowerShell do script de configuração
- `start-servers.bat` - Inicia todos os servidores
- `stop-servers.bat` - Encerra todos os servidores

## 📖 Documentação

Consulte [CONFIGURACAO.md](CONFIGURACAO.md) para:
- Guia detalhado de instalação
- Configuração do servidor rAthena
- Integração com NPCs
- Resolução de problemas
- Configurações de segurança

**Documentação Adicional:**
- [GUIA-RAPIDO.md](GUIA-RAPIDO.md) - Referência rápida para início imediato
- [CONFIGURACAO-MANUAL-RATHENA.md](CONFIGURACAO-MANUAL-RATHENA.md) - Configuração manual dos arquivos .conf
- [INDICE-COMPLETO.md](INDICE-COMPLETO.md) - Índice de todos os arquivos e scripts do projeto

## 🔧 Configuração

### Banco de Dados
- Host: `127.0.0.1`
- Porta: `3306`
- Usuário: `root`
- Senha: `1234`
- Database: `rathena`

### Servidores
- Login Server: `127.0.0.1:6900`
- Char Server: `127.0.0.1:6121`
- Map Server: `127.0.0.1:5121`

## 📂 Estrutura

```
ProjetoRAGNALobo/
├── config/          # Configurações do servidor
├── modules/         # Módulos funcionais
├── themes/          # Temas visuais
├── data/            # Dados e logs
│   ├── npc/        # Scripts NPC
│   └── logs/       # Logs do sistema
└── lib/             # Bibliotecas core
```

## 🎨 Temas

- `default` - Tema clássico
- `bootstrap` - Tema moderno responsivo

## 🌐 Idiomas Disponíveis

- Português (pt_br) - **Padrão**
- English (en_us)
- Español (es_es)
- Indonesian (id_id)

## 🔐 Segurança

⚠️ **IMPORTANTE**: Altere as credenciais padrão após instalação!

- Senha do instalador: Altere em `config/application.php`
- Senha MySQL: Configure adequadamente
- Permissões: Garanta que `data/` seja gravável

## 📝 NPCs Incluídos

- **web_commands.txt** - Comandos via web
- **support_cmd.txt** - Sistema de suporte
- **DonationNPC.txt** - Doações
- **PeakNPC.txt** - Estatísticas de pico

## 🆘 Suporte

Para problemas comuns, consulte a seção "Resolução de Problemas" em [CONFIGURACAO.md](CONFIGURACAO.md).

---

## 📚 Referências

FluxCP
======
[![Total alerts](https://img.shields.io/lgtm/alerts/g/rathena/FluxCP.svg?logo=lgtm&logoWidth=18&color=orange)](https://lgtm.com/projects/g/rathena/FluxCP/alerts/)
[![Open Issues](https://img.shields.io/github/issues/rathena/FluxCP.svg?logo=github&logoWidth=18&color=yellow)](https://lgtm.com/projects/g/rathena/FluxCP/alerts/)
[![Open PRs](https://img.shields.io/github/issues-pr/rathena/FluxCP.svg?logo=github&logoWidth=18&color=blue)](https://lgtm.com/projects/g/rathena/FluxCP/alerts/)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/d842cd47636244668f3093151b288eff)](https://www.codacy.com/app/rathena/FluxCP?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=rathena/FluxCP&amp;utm_campaign=Badge_Grade)

Flux Control Panel (FluxCP) for rAthena servers.

Requirements
---------
* PHP 5.2
* PDO and PDO-MYSQL extensions for PHP5 (including PHP_MYSQL support)
* MySQL 5
* Optional: GD2 (for guild emblems and registration CAPTCHA)
* Optional: Tidy (for cleaner HTML output)
* Optional: mod_rewrite support for UseCleanUrls feature
* Optional: [Item images](http://rathena.org/board/files/file/2509-item-images/)


What's New?
---------
* The description files are kept upto-date with each new commit from rAthena.
* Pre-integrated themes:
	- default
	- Bootstrap
	
* Built-In:
	- News and Pages CMS with integrated TinyMCE
	- Service Desk (ITIL Incident Management style support ticket system)
	- Additional Logs
	- More Ranking Lists
    - Discord Integration
    - Google ReCaptcha
    - Remote AtCommand functionality


How To ... ?
---------
We have a small doc library that covers:
* Basic User Documentation
    - Installation
    - [Themes](https://github.com/rathena/FluxCP/blob/master/doc/user_theme.md)
    - [Languages](https://github.com/rathena/FluxCP/blob/master/doc/user_lang.md)
    - Installing Addons
    - Updating FluxCP

* Developer Documentation
    - Creating an Addon
    - Providing Addon updates
    - Creating a custom Theme


Join the Discussion
---------
We have a discord server separate from rAthena just for FluxCP stuff!
The channels there can be used to obtain help, discuss testing, view anonymous feedback log, Github commits, etc.
https://discord.gg/0XP9qqhUV9GLSfCh


Extra Credits
---------
Original FluxCP created by Paradox924X and Byteflux with additional contributions from Xantara.
Some works from other users have been integrated into this project.
