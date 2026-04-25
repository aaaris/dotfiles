-- blink.cmp 安装补全配置以及触发加载
vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
}, {
  load = function(plug_data)
    vim.api.nvim_create_autocmd("InsertEnter", {
      once = true,
      callback = function()
        vim.cmd.packadd(plug_data.spec.name)
        -- 加载 plugin 文件
        require("blink.cmp").setup({
          keymap = {
            preset = "super-tab",
            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            -- ["<Tab>"] = { "select_next", "fallback" },
            -- ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
          },
          appearance = {
            nerd_font_variant = "mono",
          },
          sources = {
            default = { "lsp", "path", "snippets", "buffer" },
          },
          fuzzy = { implementation = "prefer_rust_with_warning" },
          completion = {
            keyword = { range = "prefix" },
            menu = {
              draw = {
                treesitter = { "lsp" },
              },
            },
            trigger = { show_on_trigger_character = true },
            documentation = {
              auto_show = true,
            },
          },
          signature = { enabled = true },
        })
      end,
    })
  end,
})
