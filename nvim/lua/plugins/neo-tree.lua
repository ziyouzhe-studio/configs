-- 文件树
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {"<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neotree"},
    },
    lazy = false,

    config = function()
        require("neo-tree").setup({
            -- 定义neo-tree窗口
            window = {
                width = 25,
            },

            close_if_last_window = true, -- 只剩最后一个窗口关闭
            popup_border_style = true,
            enable_git_status = true,
            enable_diagnostics = true, -- 显示lsp诊断
            filesystem = {
                follow_current_file = {enabled = true}, -- 自动定位当前文件
                filtered_items = {
                    visible = true, -- 显示隐藏文件
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        })
    end
}
