vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
})

vim.keymap.set(
  "n",
  "<leader>?",
  function()
    require("which-key").show({ global = false })
  end,
  { desc = "Buffer Local Keymaps (which-key)" })
