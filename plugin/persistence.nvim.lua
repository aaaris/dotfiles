----------------------
-- 自动会话管理 --
----------------------
vim.pack.add({
  { src = "https://github.com/folke/persistence.nvim" },
})

-- 配置（自动保存+自动恢复）
require('persistence').setup({
  -- 会话保存目录（Windows 自动适配）
  dir = vim.fn.stdpath('state') .. '/sessions/',
  -- 保存的内容（推荐配置）
  options = {
    'buffers', 'curdir', 'tabpages', 'winsize',
    'folds', 'help', 'terminal', 'localoptions'
  },
  -- 退出时自动保存
  autosave = true,
})

-- 启动时自动恢复上次会话（可选）
vim.api.nvim_create_autocmd('VimEnter', {
  nested = true,
  callback = function()
    -- 只有当没有打开任何文件时才自动恢复
    if vim.fn.argc() == 0 then
      require('persistence').load()
    end
  end,
  once = true,
})

-- 快捷键映射
vim.keymap.set('n', '<leader>ss', require('persistence').save, { desc = 'Save session' })

-- 直接用 persistence.nvim 自带的会话选择器（Windows 100% 兼容）
vim.keymap.set('n', '<leader>sp', function()
  require('persistence').select()
end, { desc = 'Select and load session' })
