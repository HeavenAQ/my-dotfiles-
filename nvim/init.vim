""" Optixal's Neovim Init.vim

""" Vim-Plug
call plug#begin()

" Core (treesitter, nvim-lspconfig, nvim-cmp, nvim-telescope, nvim-lualine)
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'dkarter/bullets.vim'
Plug 'wellle/context.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'folke/lsp-colors.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'pangloss/vim-javascript'
Plug 'isruslan/vim-es6'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jsborjesson/vim-uppercase-sql'
Plug 'mattn/emmet-vim'
Plug 'shmup/vim-sql-syntax'
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}

" Functionalities - Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'
Plug 'Vimjas/vim-python-pep8-indent'

" Aesthetics - Colorschemes
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'bluz71/vim-moonfly-colors'
Plug 'EdenEast/nightfox.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Aesthetics - Others
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'

call plug#end()

""" Main Configurations
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list listchars=trail:??,tab:??-
set fillchars+=vert:\ 
set wrap breakindent
set linebreak
set encoding=utf-8
set textwidth=0
set wrapmargin=1
set formatoptions+=t
set formatoptions-=l 
set cursorline
set hidden
set number
set title

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType html inoremap {{ {{  }}<left><left><left>
autocmd FileType html inoremap {% {%  %}<left><left><left>
autocmd FileType html inoremap {# {#  #}<left><left><left>

"templates for certain file extention
"augroup templates
"  au!
"  " read in template files
"  autocmd BufNewFile *.* silent! execute '0r ~/.config/nvim/templates/skeleton.'.expand("<afile>:e")
"augroup END


" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Coloring

" Functions and autocmds to run whenever changing colorschemes
function! TransparentBackground()
    highligh NormalFloat guibg=NONE
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    set fillchars+=vert:\???
    highlight WinSeparator gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
    highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
endfunction

" Use these colors for Pmenu, CmpPmenusBorder and TelescopeBorder when using nightfly colorscheme
function! NightflyTweaks()
    " Pmenu colors when not using bordered windows
    highlight Pmenu guibg=#363948
    highlight PmenuSbar guibg=#363948
    " Completion/documentation Pmenu border color when using bordered windows
    highlight link CmpPmenuBorder NonText
    " Telescope borders
    highlight link TelescopeBorder Constant
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme nightfly call NightflyTweaks()
    autocmd ColorScheme * call TransparentBackground() " uncomment if you are using a translucent terminal and you want nvim to use that
augroup END

set termguicolors

color nightfly
""" Core plugin configuration (vim)

" Treesitter
augroup nightflyTreesitterSourcingFix
    autocmd!
    autocmd ColorScheme nightfly runtime after/plugin/nightfly.vim
    syntax on
augroup end

" nvim-cmp
set completeopt=menu,menuone,noselect

" signify
let g:signify_sign_add = '???'
let g:signify_sign_delete = '???'
let g:signify_sign_change = '???'
hi DiffDelete guifg=#ff5555 guibg=none

" indentLine
let g:indentLine_char = '???'
let g:indentLine_defaultGroup = 'NonText'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" context.vim
let g:context_nvim_no_redraw = 1

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Python
let g:python3_host_prog = '~/.config/nvim/env/bin/python3'
let g:pydocstring_doq_path = '~/.config/nvim/env/bin/doq'

"LSP color modification (overwrite nightly settings)
highlight NormalFloat guibg=NONE
exec 'highlight DiagnosticUnderlineError guisp=#db4b4b guifg=#db4b4b'
exec 'highlight DiagnosticUnderlineWarning guisp=#e0af68 guifg=#e0af68'
exec 'highlight DiagnosticUnderlineHint guisp=#0db9d7 guifg=#0db9d7'
exec 'highlight DiagnosticUnderlineInformation guisp=#10B981 guifg=#10B981'


""" Core plugin configuration (lua)
lua << EOF
require('treesitter-config')
require('nvim-cmp-config')
require('lspconfig-config')
require('telescope-config')
require('lualine-config')
require('nvim-tree-config')
require('diagnostics')
require('lspkind')
EOF

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" limelight color
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'gray'

""" Custom Mappings (vim) (lua custom mappings are within individual lua config files)

" Core
let mapleader=","
nmap <leader>q :NvimTreeFindFileToggle<CR>
nmap \ <leader>q
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <S-e> :bnext<CR>
nmap <S-w> :bprevious<CR>
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>

" Python
autocmd Filetype python nmap <leader>d <Plug>(pydocstring)
autocmd FileType python nmap <leader>p :Black<CR>

" Solidity (requires: npm install --save-dev prettier prettier-plugin-solidity)
autocmd Filetype solidity nmap <leader>p :0,$!npx prettier %<CR>

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>f/ <cmd>Telescope current_buffer_fuzzy_find<cr>

" html file settings
let g:user_emmet_leader_key='<C-D>'
let g:user_emmet_mode='a'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.ts'

let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

let g:closetag_filetypes = 'html,xhtml,phtml,js,ts'

let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_enable_react_fragment = 1

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100


"setting clipboard copy and paste
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif
if has('win32')
  runtime ./windows.vim
endif

runtime ./maps.vim

