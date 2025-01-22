-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "csharp_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- Configure csharp_ls to support decompilation
lspconfig.csharp_ls.setup {
  cmd = { "csharp-ls" }, -- Ensure this points to your csharp-ls executable
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  handlers = {
    ["textDocument/definition"] = require('csharpls_extended').handler,
    ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
  },
  -- Additional settings as needed
}

-- Test
local cmp = require('cmp')
cmp.register_source('easy-dotnet', require('easy-dotnet').package_completion_source)
cmp.setup({
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(),  -- Navigate to the previous item
    ['<Down>'] = cmp.mapping.select_next_item(), -- Navigate to the next item
    ['<Tab>'] = cmp.config.disable, --nil,  -- Optionally disable Tab for navigation
    ['<S-Tab>'] = cmp.config.disable, --nil,  -- Optionally disable Shift+Tab
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
    ['<Esc>'] = cmp.mapping.close(),  -- Close the completion menu
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'easy-dotnet' },
    { name = 'buffer' },
    { name = 'path' },
  },
})
