vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/greggh/claude-code.nvim", name = "claude-code" },
})

require("claude-code").setup()

vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude Code" })
vim.keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
vim.keymap.set("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", { desc = "Add file" })
