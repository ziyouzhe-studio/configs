" ===========================
" 基本设置
" ===========================
" Esc键设置
let mapleader = ','
inoremap jk <ESC>

" 界面设置
set number relativenumber
set ruler showcmd showmode
set cursorline
set textwidth=80
set colorcolumn=+1

" 搜索设置
set hlsearch incsearch
set ignorecase smartcase

" 缩进设置
set autoindent smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" 文件处理
set encoding=utf-8
set fileencoding=utf-8
set autoread
set history=1000

" 其他设置
set clipboard=unnamedplus
set list listchars=tab:»■,trail:■
set noerrorbells visualbell
set backspace=indent,eol,start


" ===========================
" 插件管理
" ===========================
call plug#begin()
" 编辑栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" 主题
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'

" 文件浏览搜索
" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-lua/plenary.nvim'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

" 代码工具
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'raimondi/delimitmate'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'preservim/tagbar'
" Git 集成
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" 语言支持
Plug 'pangloss/vim-javascript'
Plug 'octol/vim-cpp-enhanced-highlight'

" 实用工具
" 代码小地图
Plug 'wfxr/minimap.vim'
" 开始视图
Plug 'mhinz/vim-startify'
" Markdown支持
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/mathjax-support-for-mkdp'
" 快速代码注释
Plug 'tpope/vim-commentary'
"自动标签管理
Plug 'ludovicchabant/vim-gutentags'
call plug#end()


" ===========================
" 插件配置
" ===========================
" Airline 配置
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" NERDTree 配置
let g:NERDTreeWinSize = 25
let g:NERDTreeShowLineNumbers=1
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-t> :NERDTreeClose<CR>

" 主题配置
set termguicolors
let g:gruvbox_style = 'night'
let g:gruvbox_enable_italic = 1
let g:gruvbox_transparent_background = 1
set background=dark
colorscheme gruvbox

"fzf启用模糊搜索
set rtp+=~/.fzf
if executable('fzf')
    command! -bang -nargs=* Files call fzf#vim#files(<q-args>)
    command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heding --color=always --smart-case '.shellescape(<q-args), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50:hidden', '?'))
endif

" 其他插件配置
let g:minimap_width = 11
let g:minimap_auto_start = 1
let g:indentLine_setColors = 0
let g:indent_guides_enable_on_vim_startup = 1


" ===========================
" 快捷键映射
" ===========================
" 缓冲区导航
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" 工具切换
nmap <C-s> :IndentLinesToggle<CR>
nmap <C-u> :TagbarToggle<CR>

" 清除搜索高亮
nnoremap <silent> <leader><space> :nohlsearch<CR>

" 快速保存
nnoremap <leader>w :w<CR>

" 模糊搜索
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>

" ===========================
" 特定文件类型设置
" ===========================
filetype plugin indent on
syntax on

" Markdown 设置
augroup markdown_settings
    autocmd!
    autocmd FileType markdown setlocal wrap linebreak nolist
augroup END

" Python 设置
augroup python_settings
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
augroup END

" gutentags 配置
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.git', '.svn', '.root']
let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
