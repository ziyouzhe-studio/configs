return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig", -- nvim-lspconfig插件为其他lsp提供配置，在打开文件时调用相应的lsp
        "williamboman/mason-lspconfig.nvim", -- 由于nvim-lspconfig的lsp和mason命名不一致，使用mason-lspconfig将mason的lsp名称转换为nvim-lspconfig对应名称
    }, 
    opts = {
        options = {
            -- 基于 LSP 功能对 Bufferline 进行拓展.
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diagnostics_dict, _)
                local indicator = " "
                for level, number in pairs(diagnostics_dict) do
                    local symbol
                    if level == "error" then
                        symbol = ""
                    elseif level == "warning" then
                        symbol = ""
                    else
                        symbol = ""
                    end
                    indicator = indicator .. number .. symbol
                end
                return indicator
            end
        }
    },
    config = function(_, opts)
        require("mason").setup(opts)
        local registry = require "mason-registry"

        local function setup(name, config)
            local success, package = pcall(registry.get_package, name)
                if success and not package:is_installed() then
                    package:install()
                end

            local lsp = require("mason-lspconfig.mappings.server").package_to_lspconfig[name]
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

            config.on_attach = function (client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end

            require("lspconfig")[lsp].setup(config)
        end

        setup("lua-language-server", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                }
            }
        })

    vim.cmd("LspStart")
    vim.diagnostic.config({update_in_insert = true})
    end,
}
