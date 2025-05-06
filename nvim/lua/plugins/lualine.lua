return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function(_, opts)
        -- 自定义操作系统图标
        local function os_icon()
            local uname = vim.loop.os_uname().sysname
            if uname == "Linux" then
                return "󰣨 Gentoo"
            elseif uname == "Darwin" then
                return " macOS"
            elseif uname == "Windows_NT" then
                return " Windows"
            else
                return " Unknown"
            end
        end

        -- 主机名
        local function hostname()
            return "󰒋 " .. vim.loop.os_gethostname()
        end

        -- 电池状态（Linux系统需要安装 acpi 工具）
        local function battery_status()
            local handle = io.popen("acpi -b 2>/dev/null")
            if not handle then return "" end

            local result = handle:read("*a")
            handle:close()

            if not result or result == "" then return "" end

            local percentage = result:match("(%d?%d?%d)%%")
            local charging = result:match("Charging")

            if percentage then
                local icon = ""
                local num = tonumber(percentage)

                if num >= 90 then icon = ""
                elseif num >= 60 then icon = ""
                elseif num >= 40 then icon = ""
                elseif num >= 20 then icon = ""
                else icon = "" end

                if charging then icon = icon .. "⚡" end

                return icon .. " " .. percentage .. "%"
            end

            return ""
        end

        -- 设置 lualine
        require("lualine").setup({
            options = {
                theme = "dracula",
                icons_enabled = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    os_icon,
                    hostname,
                    "branch",
                    {
                        "diff",
                        symbols =  { added = ' ', modified = ' ', removed = ' ' },
                        colored = true,
                    },
                },
                lualine_c = { "filename" },
                lualine_x = { battery_status, "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end
}

