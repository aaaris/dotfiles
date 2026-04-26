----------------------
-- 功能插件配置 --
----------------------
vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.pick" },  -- 文件/缓冲区选择器
  { src = "https://github.com/nvim-mini/mini.files" }, -- 文件浏览器
}, { load = false })
----------------------
-- mini.pairs 自动括号配对（输入({自动补全})）
----------------------
vim.pack.add({
  { src = "https://github.com/echasnovski/mini.pairs", opt = false },
})

-- 启用自动配对（0 配置，直接用）
require('mini.pairs').setup({
  -- 以下是默认配置，支持所有常用符号：() [] {} '' ""
  modes = { insert = true, command = true, terminal = false },
  -- 跳过某些字符的自动配对（可选，默认不用改）
  skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
})


vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("mini.files").setup()
    require("mini.pick").setup({
      window = {
        config = function()
          local height = math.floor(0.618 * vim.o.lines)
          local width = math.floor(0.618 * vim.o.columns)
          return {
            border = 'rounded',
            anchor = "NW",
            height = height,
            width = width,
            row = math.floor(0.5 * (vim.o.lines - height)),
            col = math.floor(0.5 * (vim.o.columns - width)),
          }
        end,
      },
    })
  end,
})
-- keymapping
--
vim.keymap.set("n", "<leader>E", ":lua MiniFiles.open()<CR>", { desc = "open file explorer in work dir", noremap = true })
vim.keymap.set(
  "n",
  "<leader>e",
  ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
  { desc = "open file explorer in current file dir", noremap = true }
)
vim.keymap.set("n", "<leader>f", ":Pick files<CR>", { desc = "open file picker", noremap = true })
vim.keymap.set("n", "<leader>h", ":Pick help<CR>", { desc = "open help picker", noremap = true })
vim.keymap.set("n", "<leader>r", ":Pick buffers<CR>", { desc = "open buffer picker", noremap = true, silent = true })
