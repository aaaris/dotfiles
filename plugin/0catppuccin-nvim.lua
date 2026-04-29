vim.pack.add {
  { src = "http://github.com/catppuccin/nvim", name = "catppuccin" }
}

require("catppuccin").setup({
  transparent_background = true, -- disables setting the background color.
  float = {
    transparent = true,          -- enable transparent floating windows
    solid = false,               -- use solid styling for floating windows, see |winborder|
  },
  -- styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
  --   comments = { "italic" },     -- Change the style of comments
  --   conditionals = { "italic" },
  -- },
  custom_highlights = function(colors)
    return {
      FlashMatch = { fg = "#d0d0d0", bg = "#4477ff" },
      FlashCurrent = { fg = colors.base, bg = colors.yellow, bold = true },
      FlashLabel = { fg = "#F0F0F0", bg = "#ff4477", bold = true },
      FlashBackdrop = { fg = colors.surface2, bg = colors.none },
    }
  end,
  integrations = {
    cmp = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    flash = true,
    blink_cmp = {
      style = 'bordered'
    },

    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin-nvim"
