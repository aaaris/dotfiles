----------------------
-- lazygit.nvim（首选图形化 Git）--
----------------------
-- 1. 先安装 lazygit 本体（Windows 用 scoop 最方便）
-- scoop install lazygit

-- 2. 安装 Neovim 插件
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" }, -- 依赖
  { src = "https://github.com/kdheepak/lazygit.nvim" },
})


-- 4. 快捷键
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<CR>', { desc = 'Open LazyGit' })
vim.keymap.set('n', '<leader>gf', '<cmd>LazyGitCurrentFile<CR>', { desc = 'LazyGit current file' })
