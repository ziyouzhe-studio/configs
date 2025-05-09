require("core.options")
require("core.keymaps")
require("core.lazy")

-- 主题
vim.cmd("colorscheme catppuccin")


-- 设置背景透明
vim.cmd("autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("autocmd VimEnter * hi VertSplit guibg=NONE ctermbg=NONE")
vim.cmd("autocmd VimEnter * hi StatusLine guibg=NONE ctermbg=NONE")
vim.cmd("autocmd VimEnter * hi TabLine guibg=NONE ctermbg=NONE")
vim.cmd("autocmd VimEnter * hi Pmenu guibg=NONE ctermbg=NONE")

