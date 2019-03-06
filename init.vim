call plug#begin('~/.local/share/nvim/plugged')

" Git helper
Plug 'tpope/vim-fugitive'

" Show changed line
Plug 'airblade/vim-gitgutter'

" File browser
Plug 'scrooloose/nerdtree'

" Theme
Plug 'morhetz/gruvbox'

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
Plug 'edkolev/tmuxline.vim'

" Text alignment
Plug 'junegunn/vim-easy-align'

" Completion engine
Plug 'Valloric/YouCompleteMe'

" LSP for Vim
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" Alignment
Plug 'junegunn/vim-easy-align'

call plug#end()

filetype on
filetype plugin on
filetype indent on

let mapleader=","

" Convenient vimrc editing
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vs :so $MYVIMRC<CR>

" Mapping for closing buffer 
map <leader>bc b:bp<bar>sp<bar>bn<bar>bd<CR>

" General settings
syntax on
set nu
set incsearch
set cindent
set wildignore=*.o,*.obj,*.bak,*.exe
set nofoldenable
set ignorecase smartcase
set confirm
set autoread
set splitright
set splitbelow
set nohlsearch
set hidden

set ts=4
set sw=4
set expandtab

" General navigation
map <c-j> j<c-e>
map <c-k> k<c-y>
map <c-l> :bnext<enter>
map <c-h> :bprevious<enter>
map <F2> :e#<CR>
map + <C-W>+
map - <C-W>-
nnoremap <F5> :buffers<CR>:buffer<Space>

" Split navigation in different modes
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

colorscheme gruvbox
set background=dark

" Finally, a trick by Steve Losh for when you forgot to sudo before editing a file that requires root privileges (typically /etc/hosts). This lets you use w!! to do that after you opened the file already:
cmap w!! w !sudo tee % >/dev/null


" If you like long lines with line wrapping enabled, this solves the problem that pressing down jumpes your cursor “over” the current line to the next line. It changes behaviour so that it jumps to the next row in the editor (much more natural):
nnoremap j gj
nnoremap k gk

" ListToggle
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_location_list_toggle_map = '<leader>l'

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" fswitch
nnoremap <silent> <Leader>of :FSHere<cr>
nnoremap <silent> <Leader>os :FSSplitRight<cr>

" ctrlp
let g:ctrlp_map = '<c-f>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#obsession#enabled = 1

" airline
set laststatus=2
set timeoutlen=500
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

" YCM
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1

" Registering cquery for vim-lsp
if executable('cquery')
 au User lsp_setup call lsp#register_server({
    \ 'name': 'cquery',
    \ 'cmd': {server_info->['cquery']},
    \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
    \ 'initialization_options': { 'cacheDirectory': '~/.cache/cquery' },
    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
    \ })
endif

" lsp-vim mappings
nnoremap <Leader>sf :LspDefinition<cr>
nnoremap <Leader>sr :LspReferences<cr>
nnoremap <Leader>st :LspTypeDefinition<cr>
nnoremap <Leader>sh :LspHover<cr>
nnoremap <leader>sn :LspRename<cr>

let g:lsp_diagnostics_enabled = 0     " disable diagnostics support
let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '!', 'icon': '/path/to/some/icon'} " icons require GUI
let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'} " icons require GUI

highlight link LspErrorText GruvboxRedSign " requires gruvbox
highlight clear LspWarningLine

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
