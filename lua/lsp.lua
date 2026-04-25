----------------------
-- LSP 配置 --
----------------------
-- 启用 LSP
------------------------
-- 启动加载的插件 --
----------------------
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" }, -- 语法高亮和折叠
})
vim.lsp.enable({ "biome", "lua_ls", "stylua", "clangd", "basedpyright" })
-- LspAttach: After an LSP Client performs "initialize" and attaches to a buffer.
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local keymap = vim.keymap
--     local lsp = vim.lsp
--     local bufopts = { noremap = true, silent = true }
--   end,
-- })
--

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
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    focusable = false,
    style = "minimal",
  },
})


-- LSP 快捷键
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", noremap = true, silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", noremap = true, silent = true })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation", noremap = true, silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references", noremap = true, silent = true })
vim.keymap.set("n", "<leader>nn", vim.lsp.buf.rename, { desc = "Rename symbol", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action", noremap = true, silent = true })

-- auto format by <C-s>
-- vim.keymap.set("n", "<leader>F", function()
--   vim.lsp.buf.format()
-- end, { desc = "format code style", noremap = true, silent = true })
