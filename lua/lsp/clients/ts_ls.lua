local lspconfig = require("lspconfig")

local M = {}

M.setup = function(on_attach, capabilities)
  lspconfig.ts_ls.setup({
    root_dir = lspconfig.util.root_pattern("package.json"),
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      local opts = { buffer = bufnr, silent = true }

      -- Use built-in code actions instead of nvim-lsp-ts-utils
      -- Organize imports
      vim.keymap.set("n", "gs", function()
        vim.lsp.buf.code_action({
          apply = true,
          filter = function(action)
            return action.title == "Organize Imports"
          end,
        })
      end, opts)

      -- Rename file (requires LSP support)
      vim.keymap.set("n", "gr", function()
        local old_name = vim.api.nvim_buf_get_name(bufnr)
        vim.ui.input({ prompt = "New filename: ", default = old_name }, function(new_name)
          if new_name and new_name ~= "" and new_name ~= old_name then
            vim.lsp.util.rename(old_name, new_name)
          end
        end)
      end, opts)

      -- Add missing imports
      vim.keymap.set("n", "gI", function()
        vim.lsp.buf.code_action({
          apply = true,
          filter = function(action)
            return action.title:match("Add missing imports") or action.title:match("Add all missing imports")
          end,
        })
      end, opts)
    end,
    capabilities = capabilities,
  })
end

return M
