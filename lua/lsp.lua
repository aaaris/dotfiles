----------------------
-- LSP 配置 --
----------------------
-- 启用 LSP
------------------------
-- 启动加载的插件 --
----------------------
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- 语法高亮和折叠
  { src = "https://github.com/neovim/nvim-lspconfig" },
})
vim.lsp.enable({ "biome", "lua_ls", "basedpyright", "ruff" })

require('nvim-treesitter').install({
  'python',
  'lua',
  'json',
}):wait(300000)

--  diagnostic
local diagnostic_signs = {
  Error = " ",
  Warn = " ",
  Hint = "",
  Info = "",
}
vim.diagnostic.config({
  virtual_text = { prefix = "●", spacing = 4 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
      [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
      [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
      [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
    },
  },
  severity_sort = true,
  float = {
    source = true,
    focusable = false,
  },
})
vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.open_float()
end, { desc = "diagnostic messages", noremap = true, silent = true, nowait = true })
-- 快速跳转诊断
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, wrap = true, count = -1 })
end, { desc = "prev diagnostic", noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, wrap = true, count = 1 })
end, { desc = "next diagnostic", noremap = true, silent = true, nowait = true })

-- LSP 快捷键
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", noremap = true, silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", noremap = true, silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", noremap = true, silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references", noremap = true, silent = true })
vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, { desc = "Rename symbol", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action", noremap = true, silent = true })
vim.keymap.set("n", "<leader>co", function()
  vim.lsp.buf.code_action({
    apply = false,
    context = {
      only = { "source.organizeImports" },
      diagnostics = {},
    }
  })
end, { desc = "LSP organize imports ", noremap = true, silent = true })
