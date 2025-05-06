-- 绑定快捷键api: vim.keymap.set(mode, lhs, rhs, opts)
-- mode: 快捷键的生效模式
--  字符(单一模式)或table(多个模式)
--  每个模式由一个字母表示: n / i / c ...
--lhs: 快捷键的按键
--  Ctrl + a: <C-a>
--  Alt + a: <A-a>
--rhs: 快捷键的功能; 可以是映射的另一组按键或者一个lua函数
--opts:table, 包含对快捷键的额外配置

-- 插入模式下输入jk切换到普通模式
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true })

-- 撤销输入
vim.keymap.set({"n", "i"}, "<C-z>", "<Cmd>undo<CR>", {silent = true})

-- 设置<leader>为逗号
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }

    -- Markdown Preview
    vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", opts)
    vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", opts)

    -- TableMode Toggle
    vim.keymap.set("n", "<leader>mt", "<cmd>TableModeToggle<CR>", opts)

    -- TOC 操作
    vim.keymap.set("n", "<leader>mg", "<cmd>GenTocGFM<CR>", opts)
    vim.keymap.set("n", "<leader>mu", "<cmd>UpdateToc<CR>", opts)

    -- 折叠（vim-markdown 支持）
    vim.keymap.set("n", "<leader>mf", "za", opts)

    -- Pencil 开关软换行
    vim.keymap.set("n", "<leader>mw", "<cmd>PencilSoft<CR>", opts)

    -- 保存时自动格式化表格（可选）
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = 0,
      callback = function()
        if vim.fn.exists(":TableFormat") == 2 then
          vim.cmd("silent! TableFormat")
        end
      end,
    })
  end,
})

