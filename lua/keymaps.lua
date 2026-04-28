----------------------
-- 快捷键配置 --
----------------------
-- 格式化

-- quick <Esc>
-- use autohotkey instead vim.keymap
-- vim.keymap.set({ "i" }, "jk", "<Esc>", { noremap = true, silent = true, nowait = true })

-- -- neovim config
vim.keymap.set("n", "<leader>cc", function()
  vim.cmd.edit("$MYVIMRC")
end, { desc = "Edit neovim config file", noremap = true, silent = true, nowait = true })


-- 窗口切换
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<leader>wl", ":vsplit<CR>",
  { desc = "Split window vertically", noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<leader>wj", ":split<CR>",
  { desc = "Split window horizontally", noremap = true, silent = true, nowait = true })
-- 调整窗口大小
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- 缩进
-----------------
-- Visual mode --
-----------------
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, nowait = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, nowait = true })
-- 行移动
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", noremap = true, silent = true, nowait = true })
vim.keymap.set(
  "v",
  "<A-j>",
  ":m '>+1<CR>gv=gv",
  { desc = "Move selection down", noremap = true, silent = true, nowait = true }
)
vim.keymap.set(
  "v",
  "<A-k>",
  ":m '<-2<CR>gv=gv",
  { desc = "Move selection up", noremap = true, silent = true, nowait = true }
)
-- 文件/插件快捷键
vim.keymap.set(
  { "n", "i", "v" },
  "<C-s>",
  "<ESC>:w<CR>",
  { desc = "save file", noremap = true, silent = true, nowait = true }
)
