----------------------
-- 通用 Neovim 设置 --
----------------------
-- vim.o.packpath:append(vim.fn.stdpath('data') .. '/site')
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.mouse = "a"               -- allow the mouse to be used in nvim

-- UI Config
vim.opt.number = true         -- 显示行号
vim.opt.relativenumber = true -- 显示相对行号
vim.opt.cursorline = true     -- 高亮光标所在行

vim.opt.splitbelow = true     -- open new vertical split bottom
vim.opt.splitright = true     -- open new horizontal splits right

vim.opt.showmode = false      -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.wrap = false          -- 不自动换行
vim.opt.smoothscroll = true
vim.opt.scrolloff = 10        -- 上下保留 5 行作为缓冲

vim.opt.signcolumn = "yes"    -- 永远显示 sign column（诊断标记）
vim.opt.winborder = "rounded" -- 窗口边框样式
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
-- vim.opt.cmdheight = 1
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""

-- Tab
vim.opt.expandtab = true -- 使用空格代替 Tab
vim.opt.tabstop = 2      -- Tab 键宽度为 2
vim.opt.shiftwidth = 2   -- 缩进宽度为 2
vim.opt.softtabstop = 2  -- soft tab stop not tabs on tab/backspace
vim.opt.smartindent = true
vim.opt.autoindent = true


-- Searching
vim.opt.ignorecase = true -- 搜索忽略大小写
vim.opt.smartcase = true  -- 当包含大写字母时，搜索区分大小写
vim.opt.hlsearch = false  -- 搜索匹配不高亮
vim.opt.incsearch = true  -- 增量搜索

-- Folding
vim.opt.foldmethod = "expr"                     -- 折叠方式使用表达式
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- 使用 Treesitter 表达式折叠
vim.opt.foldlevel = 99                          -- 打开文件时默认不折叠

vim.g.mapleader = " "                           -- 设置 leader 键为空格


vim.opt.backup = false                 -- do not create a backup file
vim.opt.writebackup = false            -- do not write to a backup file
vim.opt.swapfile = false               -- do not create a swapfile
vim.opt.updatetime = 300               -- faster completion
vim.opt.timeoutlen = 500               -- timeout duration
vim.opt.ttimeoutlen = 50               -- key code timeout
vim.opt.autoread = true                -- auto-reload changes if outside of neovim
vim.opt.autowrite = false              -- do not auto-save

vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.modifiable = true
vim.opt.encoding = "utf-8"

-- optional for windows
if vim.fn.has("win32") == 1 then
  -- 设置默认终端为 pwsh.exe (PowerShell 7)
  vim.opt.shell = "pwsh.exe"
  -- PowerShell 启动参数（无Logo、无配置文件、快速启动）
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

-- different position for term
local openTerm = function(pos)
  if pos == nil then
    vim.cmd("term")
  end
  if pos == "r" then
    vim.cmd("vsplit")
    vim.cmd("term")
  end
  if pos == "d" then
    vim.cmd("split")
    vim.cmd("term")
  end
  vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>tt", function() openTerm() end, {
  noremap = true,
  silent = true,
  desc =
  "Open terminal in a new buffer"
})
vim.keymap.set("n", "<leader>tk", function() openTerm("d") end, {
  noremap = true,
  silent = true,
  desc =
  "Open terminal and split in a down buffer"
})
vim.keymap.set("n", "<leader>tl", function() openTerm("r") end, {
  noremap = true,
  silent = true,
  desc =
  "Open terminal and split in a right buffer"
})

--  term insert back to normal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })



-- 注册命令：:PackCleanPick
vim.api.nvim_create_user_command("PackCleanPick", function()
  -- 1. 获取【未激活/冗余】插件（核心逻辑）
  local inactive_plugins = vim.iter(vim.pack.get())
      :filter(function(p) return not p.active end)
      :map(function(p)
        return {
          name = p.spec.name,
          text = p.spec.name -- mini.pick 必须用 text 字段显示
        }
      end)
      :totable()

  -- 无插件直接退出
  if #inactive_plugins == 0 then
    vim.notify("✅ 无冗余插件可清理", vim.log.levels.INFO)
    return
  end
  local ok, MiniPick = pcall(require, "mini.pick")
  if not ok then
    vim.notify("❌ 请先安装 mini.pick", vim.log.levels.ERROR)
    return
  end
  -- 2. 启动 MiniPick（最新标准API，无全局变量、无nil风险）
  MiniPick.start({
    source = {
      name = "冗余插件（标记删除）",
      items = inactive_plugins,
      -- 单选执行
      choose = function(item)
        vim.pack.del({ item.name })
        vim.notify("🗑️ 删除: " .. item.name, vim.log.levels.SUCCESS)
      end,
      -- 多选执行（核心）
      choose_marked = function(marked_items)
        if #marked_items == 0 then
          vim.notify("⚠️ 未选择任何插件", vim.log.levels.WARN)
          return
        end

        local deleted = {}
        for _, item in ipairs(marked_items) do
          pcall(vim.pack.del, { item.name })
          table.insert(deleted, item.name)
        end

        vim.notify(string.format("✅ 批量删除 %d 个插件:\n%s", #deleted, table.concat(deleted, ", ")), vim.log.levels.SUCCESS)
      end,
    },
  })
end, { desc = "mini.pick 可视化卸载冗余插件" })

-- 可选：绑定快捷键 <leader>px 快速调用
vim.keymap.set("n", "<leader>px", "<cmd>PackCleanPick<CR>", {
  desc = "mini.pick 清理冗余插件"
})
