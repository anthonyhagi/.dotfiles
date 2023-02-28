local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
	'tsserver',
	'eslint'
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

-- Set up a function to execute organising imports within TS files.
-- local function organise_imports_ts()
--  local params = {
--    command = "_typescript.organiseImports",
--    arguments = {vim.api.nvim_buf_get_name(0)},
--    title = ""
--  }
--
--  vim.lsp.buf.execute_command(params)
-- end

--lspconfig.tsserver.setup {
--  on_attach = on_attach,
--  capabilities = capabilities,
--  commands = {
--    OrganiseImports = {
--      organise_imports_ts,
--      description = "Organise file imports"
--    }
--  }
--}
