# Neovim Configuration

A modern Neovim configuration with LSP support, fuzzy finding, and a beautiful UI.

## Prerequisites

### Required

- **Neovim** >= 0.9
- **Git**
- **A Nerd Font** (for icons) - [Nerd Fonts](https://www.nerdfonts.com/)

### Recommended

- **fzf** - Fuzzy finder (auto-installed by packer, but system install is faster)
- **ripgrep** - For live grep functionality
- **bat** - Syntax highlighting in previews
- **tmux** - For tmux-navigator integration

## Installation

### 1. Install Neovim

```bash
brew install neovim
```

### 2. Clone this repository

```bash
git clone git@github.com:victorblasco/nvim-config.git ~/Code/nvim-config
```

### 3. Create symlink

```bash
ln -s ~/Code/nvim-config ~/.config/nvim
```

### 4. Start Neovim

```bash
nvim
```

On first launch, Packer will auto-install itself and all plugins. Wait for the installation to complete.

### 5. Install Treesitter parsers

```vim
:TSUpdate
```

### 6. Install Language Servers

Open Mason and install the servers you need:

```vim
:Mason
```

**Recommended servers:**

| Server | Language |
|--------|----------|
| `lua_ls` | Lua |
| `ts_ls` | TypeScript/JavaScript |
| `eslint` | JavaScript linting |
| `solargraph` | Ruby |
| `sorbet` | Ruby (type checking) |

## Key Mappings

**Leader key:** `,`

Press `<Space>` to see all available keybindings via which-key.

### General

| Key | Action |
|-----|--------|
| `jk` | Exit insert mode |
| `<C-h/j/k/l>` | Navigate windows |
| `<Tab>` / `<S-Tab>` | Next/previous buffer |
| `<leader>d` | Close buffer |

### File Navigation

| Key | Action |
|-----|--------|
| `<leader>p` | Toggle file tree |
| `<leader>o` | Fuzzy find git files |
| `<leader>a` | Live grep |

### LSP

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `<leader>ld` | Find definitions |
| `<leader>lr` | Find references |
| `<leader>lR` | Rename symbol |
| `<leader>li` | LSP info |
| `<leader>lm` | Open Mason |

### Git

| Key | Action |
|-----|--------|
| `<leader>gb` | Git blame |
| `<leader>gs` | Git status |
| `<leader>gc` | Git commits |

### Search

| Key | Action |
|-----|--------|
| `<leader>sb` | Search buffers |
| `<leader>st` | Search text (live grep) |
| `<leader>sw` | Search current word |

## Plugin Highlights

- **[packer.nvim](https://github.com/wbthomason/packer.nvim)** - Plugin manager
- **[catppuccin](https://github.com/catppuccin/nvim)** - Color scheme (mocha)
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP/formatter installer
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion
- **[fzf-lua](https://github.com/ibhagwan/fzf-lua)** - Fuzzy finder
- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git integration
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Statusline
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Keybinding help

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point
└── lua/
    ├── plugins.lua       # Plugin specifications
    ├── plugins/          # Plugin configs
    ├── lsp/              # LSP setup
    │   ├── init.lua
    │   └── clients/      # Per-server configs
    ├── settings.lua      # Neovim options
    ├── keymappings.lua   # Key bindings
    ├── autocommands.lua  # Autocommands
    └── utils.lua         # Utility functions
```

## Updating

```vim
:PackerSync
```

## Troubleshooting

### Icons not displaying correctly

Install a [Nerd Font](https://www.nerdfonts.com/) and configure your terminal to use it.

### LSP not working

1. Check if the server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Check for errors: `:checkhealth`

### Treesitter errors

Update parsers with `:TSUpdate` or reinstall specific ones with `:TSInstall <language>`.
