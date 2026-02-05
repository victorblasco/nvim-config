local wk = require("which-key")

wk.setup({
    plugins = {
        marks = true,
        registers = true,
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
    },
    win = {
        border = "single",
        padding = { 0, 0 },
    },
    layout = {
        height = { min = 2, max = 25 },
        width = { min = 10, max = 70 },
        spacing = 3,
    },
})

vim.keymap.set("n", "<Space>", "<NOP>", { silent = true })

-- LSP Hover
vim.keymap.set("n", "K", vim.lsp.buf.hover)

-- Register mappings using the new add() API
wk.add({
    { "<leader>n", "<cmd>NvimTreeToggle<CR>", desc = "NerdTree" },
    { "<leader>f", "<cmd>NvimTreeFindFile<CR>", desc = "Find File" },
    { "<leader>h", ":let @/=''<CR>", desc = "No Highlight" },
    { "<leader>r", "<cmd>FzfLua resume<cr>", desc = "Resume search" },
    { "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Fuzzy search" },

    -- Git group
    { "<leader>g", group = "Git" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
    { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Git status" },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Git commits" },

    -- LSP group
    { "<leader>l", group = "LSP" },
    { "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", desc = "Definitions" },
    { "<leader>lr", "<cmd>FzfLua lsp_references<CR>", desc = "References" },
    { "<leader>lt", "<cmd>FzfLua lsp_typedefs<CR>", desc = "Type defs" },
    { "<leader>lR", vim.lsp.buf.rename, desc = "Rename" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" },

    -- Search group
    { "<leader>s", group = "Search" },
    { "<leader>sb", "<cmd>FzfLua buffers<cr>", desc = "Find buffer" },
    { "<leader>st", "<cmd>FzfLua live_grep_native<cr>", desc = "Text" },
    { "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "Current word" },

    -- Diagnostics group
    { "<leader>d", group = "Diagnostics" },
    { "<leader>da", vim.diagnostic.open_float, desc = "Current line" },
    { "<leader>dw", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace" },
    { "<leader>dd", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
    { "<leader>ds", vim.diagnostic.goto_prev, desc = "Previous Diagnostic" },
})
