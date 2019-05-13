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

" Header switch
Plug 'derekwyatt/vim-fswitch'

" Code formatting
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'

call plug#end()

call glaive#Install()

filetype on
filetype plugin on
filetype indent on

" General settings
syntax on
set nu
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

colorscheme gruvbox
set background=dark


" Indentation and tabulation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set smartindent
set autoindent

" Smart indents in .py files
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

set backspace=indent,eol,start

" Mappings
let mapleader=","

" Convenient vimrc editing
nmap <silent> <leader>ve :e $MYVIMRC<CR>
nmap <silent> <leader>vs :so $MYVIMRC<CR>

" Mapping for closing buffer 
map <leader>bc :bp<bar>sp<bar>bn<bar>bd<CR>

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

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" lsp-vim mappings
nnoremap <Leader>sd :LspDeclaration<cr>
nnoremap <Leader>sf :LspDefinition<cr>
nnoremap <Leader>sr :LspReferences<cr>
nnoremap <Leader>st :LspTypeDefinition<cr>
nnoremap <Leader>sh :LspHover<cr>
nnoremap <leader>sn :LspRename<cr>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]

" Other plugin configs
"
" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

" ctrlp
let g:ctrlp_map = '<c-f>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_regexp = 1
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" let g:ctrlp_user_command = ['.svn', 'cd %s && svn ls -R']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif 

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#obsession#enabled = 1

" airline
set laststatus=2
set timeoutlen=500
let g:airline_theme='sol'
let g:airline_powerline_fonts = 1

" ycm
let g:ycm_always_populate_location_list = 1

" Registering cquery and pyls for vim-lsp
if executable('cquery')
 au User lsp_setup call lsp#register_server({
    \ 'name': 'cquery',
    \ 'cmd': {server_info->['cquery', '--log-file=/tmp/cq.log', '--record=/tmp/cquery']},
    \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
    \ 'initialization_options': { 'cacheDirectory': $HOME . '/.cache/cquery' },
    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
    \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

let g:lsp_diagnostics_enabled = 0     " disable diagnostics support
let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '!', 'icon': '/path/to/some/icon'} " icons require GUI
let g:lsp_signs_hint = {'icon': '/path/to/some/other/icon'} " icons require GUI

highlight link LspErrorText GruvboxRedSign " requires gruvbox
highlight clear LspWarningLine
