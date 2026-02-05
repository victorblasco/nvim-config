require("ibl").setup({
  exclude = {
    filetypes = {
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "gitcommit",
      "TelescopePrompt",
      "TelescopeResults",
      "",
    },
    buftypes = {
      "terminal",
      "nofile",
      "quickfix",
      "prompt",
    },
  }
  -- show_current_context = true,
  -- show_current_context_start = false,
  -- show_end_of_line = false,
  -- show_trailing_blankline_indent = false,
  -- space_char_blankline = " ",
  -- use_treesitter = true,
  --
  --
  --
})
