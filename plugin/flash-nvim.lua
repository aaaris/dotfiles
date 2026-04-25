vim.pack.add({
  "https://github.com/folke/flash.nvim",
})


require("flash").setup({
  labels = "asdfghjklqwertyuiopzxc",
}
)
-- Flash:
vim.keymap.set({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash 双向搜索" })

-- Flash Treesitter: S
vim.keymap.set({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })
