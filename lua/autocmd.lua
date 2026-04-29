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
