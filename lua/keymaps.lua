----------------------
-- 快捷键配置 --
----------------------
-- 格式化

-- quick <Esc>
vim.keymap.set({ "i" }, "jk", "<Esc>", { noremap = true, silent = true, nowait = true })

-- -- neovim config quick open
vim.keymap.set(
	"n",
	"<leader>C",
	":e $MYVIMRC<CR>",
	{ desc = "Edit neovim config", noremap = true, silent = true, nowait = true }
)
-- TODO: reload config

-- 系统剪贴板
-- vim.keymap.set({ "n", "v" }, "<leader>c", '"+y', { desc = "copy to system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>x", '"+d', { desc = "cut to system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "paste to system clipboard" })

-- 窗口切换
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, nowait = true })
vim.keymap.set("n", "<leader>wl", ":vsplit<CR>", { desc = "Split window vertically", noremap = true })
vim.keymap.set("n", "<leader>wj", ":split<CR>", { desc = "Split window horizontally", noremap = true })
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
