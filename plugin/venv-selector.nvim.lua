vim.pack.add({
  { src = "https://github.com/linux-cultist/venv-selector.nvim" },
})

require("venv-selector").setup({
  -- 自动搜索的虚拟环境路径（全覆盖：venv/conda/poetry/uv）
  search_paths = {
    -- 项目本地环境
    ".",
    "venv",
    ".venv",
    "env",
    ".env",
    -- 全局虚拟环境
    "~/venvs",
    "~/miniconda3",
    "~/anaconda3",
    "~/.local/share/virtualenvs",
  },
  -- 适配 Neovim 0.12 原生 LSP（关键！）
  notify_user_on_venv_activate = true,
  -- 与你的 mini.pick 完美兼容（默认使用 vim.ui.select）
  shell = {
    shell = "pwsh.exe",
    shellcmdflag = "-Command"
  }
})
vim.keymap.set("n", "<leader>vs", ":VenvSelect<CR>", { desc = "Select Python virtualenv" })
