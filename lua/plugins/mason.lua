require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" }
    -- Note: solargraph removed from ensure_installed due to installation issues
    -- Install manually with :MasonInstall solargraph if needed
})
