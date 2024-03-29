call plug#begin('~/.local/share/nvim/plugged')

" Git helper
" Plug 'tpope/vim-fugitive'

" Show changed line
Plug 'airblade/vim-gitgutter'

" File browser
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

" Session management
Plug 'tpope/vim-obsession'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Comments
Plug 'scrooloose/nerdcommenter'

" Quickfix and location list helper
Plug 'Valloric/ListToggle'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tmux status bar
" Plug 'edkolev/tmuxline.vim'

" Text alignment
Plug 'junegunn/vim-easy-align'

" Header switch
Plug 'derekwyatt/vim-fswitch'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/tokyonight.nvim'
Plug 'tanvirtin/monokai.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Utility
Plug 'ojroques/vim-oscyank', { 'branch': 'main' }

" bufline
Plug 'nvim-tree/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }


Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'liuchengxu/vista.vim'
Plug 'honza/vim-snippets'

" tmux navigate
Plug 'aserowy/tmux.nvim'

call plug#end()

lua require("init")

filetype on
filetype plugin on
filetype indent on


" General settings
syntax on
set nu
set rnu

" augroup numbertoggle
  " autocmd!
  " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  " autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END
set norelativenumber

set incsearch
set wildignore=*.o,*.obj,*.bak,*.exe,*.swp,*.so,*.zip
set nofoldenable
set ignorecase smartcase
set confirm
set autoread
set splitright
set splitbelow
set nohlsearch
set hidden
set exrc
set secure
set shellcmdflag=-ic

" Colorschemes

" colorscheme gruvbox

" colorscheme challenger_deep

" colorscheme molokai
colorscheme tokyonight-storm

" set background=light
" colorscheme gruvbox

" colorscheme dracula
" colorscheme monokai

" Indentation and tabulation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set smartindent
set autoindent

set backspace=indent,eol,start

" Mappings
let mapleader=","

" Convenient vimrc editing
nn <silent> <leader>ve :e $MYVIMRC<CR>
nn <silent> <leader>vs :so $MYVIMRC<CR>

" General navigation
map <c-j> j<c-e>
map <c-k> k<c-y>
map <c-l> :bnext<enter>
map <c-h> :bprevious<enter>
map + <C-W>+
map - <C-W>-

" Mapping for closing buffer 
map <silent> <leader>bc :call common#GoBackToRecentBuffer()<bar>sp<bar>:call common#GoForwardToRecentBuffer()<bar>bd<CR>

" Split navigation in different modes
tnoremap <Esc> <C-\><C-n>

" Finally, a trick by Steve Losh for when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts). This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null

" If you like long lines with line wrapping enabled, this solves the problem that pressing down jumpes your cursor “over” the current line to the next line. It changes behaviour so that it jumps to the next row in the editor (much more natural):
nnoremap j gj
nnoremap k gk

" ListToggle
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_location_list_toggle_map = '<leader>l'

" fswitch
nnoremap <silent> <Leader>of :FSHere<cr>
nnoremap <silent> <Leader>os :FSSplitRight<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Yanking to tmux buffer
xn <silent> ty :Tyank<cr>:!lp<cr><cr>
xn <silent> tp :Tput<cr>

" Other plugin configs
"
" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" ctrlp
let g:ctrlp_map = '<c-f>'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_regexp = 1
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif 

" vim-airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#fnamecollapse = 0
" let g:airline#extensions#obsession#enabled = 1
let g:airline#extensions#vista#enabled = 1

" airline
set laststatus=2
set timeoutlen=500
" let g:airline_theme='seagull'
" let g:airline_theme='sol'
" let g:airline_theme='silver'
let g:airline_theme = 'sol'
let g:airline_powerline_fonts = 1

let base16colorspace = 256
set termguicolors

execute "source " . $HOME . "/.config/nvim/coc.vim"

let dev_env=($SSH_CLIENT != 0)
if dev_env
  execute "source " . $HOME . "/.config/nvim/dev.vim"
endif

au BufEnter *.I setlocal filetype=cpp
au BufEnter *.I let b:fswitchdst='C,cpp' | let b:fswitchlocs='./'
au BufEnter *.C let b:fswitchdst='H,I,hpp,h'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
EOF

let g:vista_default_executive = 'coc'
nnoremap <c-v> :Vista!!<cr>
