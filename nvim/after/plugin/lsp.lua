local lsp_zero = require('lsp-zero')
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = lsp_zero.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
    { buffer = bufnr, remap = false, desc = "Goto definition" })
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
    { buffer = bufnr, remap = false, desc = "Goto references" })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, remap = false, desc = "Description" })
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
    { buffer = bufnr, remap = false, desc = "Workspace symbol" })
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
    { buffer = bufnr, remap = false, desc = "Open window" })
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
    { buffer = bufnr, remap = false, desc = "Goto next diagnostic" })
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
    { buffer = bufnr, remap = false, desc = "Goto previous diagnostic" })
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
    { buffer = bufnr, remap = false, desc = "Code actions" })
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
    { buffer = bufnr, remap = false, desc = "Goto references" })
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
    { buffer = bufnr, remap = false, desc = "Rename symbol" })
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
    { buffer = bufnr, remap = false, desc = "Signature help" })

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({
      group = augroup,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end)

-- to learn how to use mason.nvim with lsp-zerolsp
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls' },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      local lspconfig = require('lspconfig')
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.lua_ls.setup(lua_opts)
      lspconfig.puppet.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { puppet = { editorServices = { formatOnType = { enable = true } } } },
      })
    end,
  }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer',  keyword_length = 3 },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-h>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
