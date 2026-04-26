----------------------
---
-- 自动命令 --
----------------------
-- 保存前自动格式化
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end,
  pattern = "*",
})

-- 复制高亮提示
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight copying text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    -- 让 Neovim 的背景完全透明
    vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'NormalNC', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'SignColumn', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'LineNr', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'CursorLine', { ctermbg = 'NONE', bg = 'NONE' })
    -- 如果还想要状态栏透明，可加上
    vim.api.nvim_set_hl(0, 'StatusLine', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'WinSeparator', { ctermbg = 'NONE', bg = 'NONE', fg = '#444444' }) -- 分割线前景色可自行调整
    vim.api.nvim_set_hl(0, 'StatusLine', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { ctermbg = 'NONE', bg = 'NONE' })
  end,
})
-- return to last cursor position
-- vim.api.nvim_create_autocmd("BufReadPost", {
--   group = augroup,
--   desc = "Restore last cursor position",
--   callback = function()
--     if vim.o.diff then -- except in diff mode
--       return
--     end
--
--     local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
--     local last_line = vim.api.nvim_buf_line_count(0)
--
--     local row = last_pos[1]
--     if row < 1 or row > last_line then
--       return
--     end
--
--     pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
--   end,
-- })
--

-- wrap, linebreak and spellcheck on markdown and text files
-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup,
--   pattern = { "markdown", "text", "gitcommit" },
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.linebreak = true
--     vim.opt_local.spell = true
--   end,
-- })
