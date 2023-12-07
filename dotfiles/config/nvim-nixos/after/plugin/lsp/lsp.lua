-- local lsputils = require("sultan.lsputils")

local servers = {
    clangd = {},
    gopls = {},
    pyright = {},
    rust_analyser = {},
    tsserver = {},
    html = { 
        filetypes = { 'html', 'twig', 'hbs' } 
    },
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false},
            telemetry = { enable = false },
        },
    },
    omnisharp = {
        cmd = { "dotnet", "/path/to/omnisharp/OmniSharp.dll" },
        enable_roslyn_analyzers = true,
        -- analyze_open_documents_only = true,
        -- enable_import_completion = true,

    },
    tsserver = {},
    html = {},
    cssls = {},
    tailwindcss = {},
    svelte = {},
    graphql = {},
    prismals = {},
    emmet_ls = {},
}


-- Lua LSP
require('neodev').setup()

-- local mason = require("mason")
-- local mason_lspconfig = require "mason-lspconfig"
-- local mason_tool_installer = require("mason-tool-installer")

-- -- mason
-- mason.setup({ 
--     -- ensure_installed = servers,  
--     -- automatic_installation = true,
--     ui = {
--         icons = {
--         package_installed = "✓",
--         package_pending = "➜",
--         package_uninstalled = "✗",
--         },
--     },
-- })

-- mason_lspconfig.setup{
--     ensure_installed = vim.tbl_keys(servers),
--     automatic_installation = true,
-- }
--
-- mason_lspconfig.setup_handlers({
--     function(server_name)
--         require("lspconfig")[server_name].setup {
--             on_attach = on_attach,
--             capabilities = capabilities,
--             settings = servers[server_name],
--             filetypes = (servers[server_name] or {}).filetypes,
--             root_dir = (servers[server_name] or {}).root_dir,
--             cmd = (servers[server_name] or {}).cmd,
--             enable_editorconfig_support = (servers[server_name] or {}).enable_editorconfig_support,
--             enable_ms_build_load_projects_on_demand = (servers[server_name] or {}).enable_ms_build_load_projects_on_demand,
--             enable_roslyn_analyzers = (servers[server_name] or {}).enable_roslyn_analyzers,
--             analyze_open_documents_only = (servers[server_name] or {}).analyze_open_documents_only,
--             enable_import_completion = (servers[server_name] or {}).enable_import_completion,
--         }
--     end,
-- })
--
-- mason_tool_installer.setup({
--     -- ensure_installed = {
--     --     "prettier", -- prettier formatter
--     --     "stylua", -- lua formatter
--     --     "isort", -- python formatter
--     --     "black", -- python formatter
--     --     "pylint", -- python linter
--     --     "eslint_d", -- js linter
--     -- },
-- })
-- --     end,
-- -- }
