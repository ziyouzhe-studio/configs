-- markdown
return {
    -- 基础语法高亮
    {
        "plasticboy/vim-markdown",
        ft = "markdown",
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_conceal = 0
            vim.g.vim_markdown_new_list_item_indent = 0
        end,
    },

    -- TOC自动生成更新
    {
        "mzlogin/vim-markdown-toc",
        ft = "markdown",
        cmd = {"GenTocGFM", "UpdateToc"},
    },
    
    -- markdown预览
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = function() vim.fn["mkdp#util#install"]() end,
        config = function()
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_browser = "system default"
        end,
    },
    
    -- markdown美化(obsidian)
    -- headlines美化样式(需要Treesitter)
    {
        "lukas-reineke/headlines.nvim",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        ft = {"markdown"},
        config = function()
            require("headlines").setup{
                markdown = {
                    headlines_highlights = {
                        "Headlien1", "Headline2", "Headline3",
                        "Headline4", "Headline5", "Headline6",
                    },
                },
            }
        end,
    },

    -- 写作增强插件(软换行等)
    {
        "preservim/vim-pencil",
        ft = "markdown",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                vim.opt_local.spell = true
                vim.opt_local.spelllang = { "en_us" }
        end,
        })

        end
    },

    -- 表格对齐
    {
        "dhruvasagar/vim-table-mode",
        ft = "markdown",
        config = function()
            vim.g.table_mode_corner = "|"
        end
    },

}
