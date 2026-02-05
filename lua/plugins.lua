-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
    -- Core dependencies
    { "nvim-lua/plenary.nvim", lazy = true },
    { "nvim-lua/popup.nvim", lazy = true },
    { "kyazdani42/nvim-web-devicons", lazy = true },

    -- Color
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("plugins.catppuccin")
        end,
    },

    -- LSP (pinned to stable version before v3.0.0 deprecations)
    { "williamboman/mason.nvim", lazy = true },
    { "williamboman/mason-lspconfig.nvim", lazy = true },
    {
        "neovim/nvim-lspconfig",
        tag = "v1.0.0",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("plugins.mason")
            require("lsp")
        end,
    },

    -- Illuminate
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("plugins.vim-illuminate")
        end,
    },

    -- Fuzzy finder
    {
        "junegunn/fzf",
        build = "./install --all",
        lazy = true,
    },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        cmd = "FzfLua",
        keys = {
            { "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Fuzzy search" },
            { "<leader>r", "<cmd>FzfLua resume<cr>", desc = "Resume search" },
        },
        config = function()
            require("plugins.fzf")
        end,
    },

    -- Autocomplete
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "onsails/lspkind-nvim",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            require("plugins.nvim-cmp")
        end,
    },
    { "hrsh7th/cmp-path", lazy = true },
    { "hrsh7th/cmp-nvim-lsp", lazy = true },
    { "hrsh7th/cmp-buffer", lazy = true },
    { "onsails/lspkind-nvim", lazy = true },
    { "L3MON4D3/LuaSnip", lazy = true },

    -- Treesitter (pinned to last stable version with old API)
    {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.2",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects", commit = "ad8f0a472148c3e0ae9851e26a722ee4e29b1595" },
        },
        config = function()
            require("plugins.nvim-treesitter")
        end,
    },

    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("plugins.gitsigns")
        end,
    },

    -- Whichkey
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.which-key")
        end,
    },

    -- Comments
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("Comment").setup()
        end,
    },

    -- Show indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("plugins.indent-blankline")
        end,
    },

    -- Better quickfix
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
    },

    -- LSP addons (none-ls replaces null-ls)
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Explorer
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = { "kyazdani42/nvim-web-devicons" },
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        keys = {
            { "<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
            { "<leader>f", "<cmd>NvimTreeFindFile<cr>", desc = "Find File" },
        },
        config = function()
            require("plugins.nvim-tree")
        end,
    },

    -- Colorize hex values
    {
        "ap/vim-css-color",
        event = { "BufReadPost", "BufNewFile" },
    },

    -- Modify faster (){}[] contents
    {
        "wellle/targets.vim",
        event = { "BufReadPost", "BufNewFile" },
    },

    -- Find and replace
    {
        "nvim-pack/nvim-spectre",
        cmd = "Spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Status Line
    {
        "hoob3rt/lualine.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.lualine")
        end,
    },

    -- Copilot
    {
        "github/copilot.vim",
        event = "InsertEnter",
        config = function()
            require("plugins.copilot")
        end,
    },

    -- Git
    {
        "tpope/vim-fugitive",
        cmd = { "Git", "G", "Gblame", "Gdiff", "Glog" },
    },

    -- Add gS and gJ keymaps for smart split/join operations
    {
        "AndrewRadev/splitjoin.vim",
        keys = { "gS", "gJ" },
    },

    -- Others
    {
        "tommcdo/vim-exchange",
        keys = { "cx", "cxx", "X" },
    },
    {
        "kylechui/nvim-surround",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "tpope/vim-repeat",
        event = { "BufReadPost", "BufNewFile" },
    },
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
        config = function()
            require("plugins.tmux-navigator")
        end,
    },
    {
        "mg979/vim-visual-multi",
        branch = "master",
        event = { "BufReadPost", "BufNewFile" },
    },
}, {
    ui = {
        border = "rounded",
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
