return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' }, -- 匹配 Neovim 内置 Lua
      workspace = {
        checkThirdParty = false,
        -- 核心：让 LSP 识别 Neovim 所有 API（vim.keymap / vim.api 等）
        library = vim.api.nvim_get_runtime_file('', true)
      },
      diagnostics = {
        globals = { 'vim' }, -- 声明 vim 是全局变量，消除报错
      },
      completion = { callSnippet = 'Replace' },
      telemetry = { enable = false }
    }
  }
}
