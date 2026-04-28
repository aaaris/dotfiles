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

local auto_read_group = vim.api.nvim_create_augroup("AutoRead", { clear = true })

-- 使用 :checktime 检查文件是否被外部修改
vim.api.nvim_create_autocmd(
  { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
  {
    group = auto_read_group,
    pattern = "*",
    command = "if mode() != 'c' | checktime | endif",
  }
)


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
    vim.api.nvim_set_hl(0, 'WinSeparator', { ctermbg = 'NONE', bg = 'NONE', fg = '#111111' }) -- 分割线前景色可自行调整
    vim.api.nvim_set_hl(0, 'StatusLine', { ctermbg = 'NONE', bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { ctermbg = 'NONE', bg = 'NONE' })
  end,
})
