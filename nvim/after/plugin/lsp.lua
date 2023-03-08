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

-- Set up a function to execute organising imports within TS files.
-- function organise_imports_ts()
--   local params = {
--     command = "_typescript.organiseImports",
--     arguments = {vim.api.nvim_buf_get_name(0)},
--     title = ""
--   }
--
--   vim.lsp.buf.execute_command(params)
-- end
--
-- lsp.configure('tsserver', {
--   on_attach = function(client, bufnr)
--     vim.keymap.set('n', '<leader>fi', '<cmd>lua organise_imports_ts()<cr>')
--   end
-- })

local ih = require('inlay-hints')

lsp.configure('tsserver', {
  on_attach = function(client, bufnr)
    ih.on_attach(client, bufnr)
  end,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    importModuleSpecifier = "non-relative"
  }
})


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()


