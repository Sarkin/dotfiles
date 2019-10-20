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
" Plug 'edkolev/tmuxline.vim'

" Text alignment
Plug 'junegunn/vim-easy-align'

" Header switch
Plug 'derekwyatt/vim-fswitch'

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-tbone'

Plug $HOME . '/arcadia/junk/vvgolubev/vim-archer'

call plug#end()

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
set shellcmdflag=-ic

" Colorschemes

" colorscheme gruvbox
" set background=dark

" colorscheme challenger_deep

let g:rehash256=1
colorscheme molokai

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
nn <silent> <leader>ve :e $MYVIMRC<CR>
nn <silent> <leader>vs :so $MYVIMRC<CR>

" Repeatedly hit <c-o> until the file changes
function! GoBackToRecentBuffer()
  let limit = 0
  let startName = bufname('%')
  let nowName = bufname('%')
  while (startName == nowName) && (limit < 100)
    exe "normal! \<c-o>"
    let nowName = bufname('%')
    let limit += 1
  endwhile
  if startName == nowName
    echo "No previous file"
  endif
endfunction

" Repeatedly hit <c-i> until the file changes
function! GoForwardToRecentBuffer()
  let limit = 0
  let startName = bufname('%')
  let nowName = bufname('%')
  while (startName == nowName) && (limit < 100)
    exe "normal! 1\<C-i>"
    let nowName = bufname('%')
    let limit +=1
  endwhile
  if startName == nowName
    echo "No next file"
  endif
endfunction

" Mapping for closing buffer 
map <silent> <leader>bc :call GoBackToRecentBuffer()<bar>sp<bar>:call GoForwardToRecentBuffer()<bar>bd<CR>

" General navigation
map <c-j> j<c-e>
map <c-k> k<c-y>
map <c-l> :bnext<enter>
map <c-h> :bprevious<enter>
map <F2> :e#<CR>
map + <C-W>+
map - <C-W>-

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

nnoremap <leader>ab :ArcBlame<cr>
nnoremap <leader>ad :ArcDiff<cr>
nnoremap <leader>adc :ArcDiffCached<cr>
nnoremap <leader>al :ArcLog<cr>
nnoremap <leader>as :ArcShow<cr>

" Yanking to tmux buffer
xn <silent> ty :Tyank<cr>:!lp<cr><cr>
xn <silent> tp :Tput<cr>

" Coc configs

" bases
nn <silent> <leader>fb :call CocLocations('ccls','$ccls/inheritance')<cr>
" derived
nn <silent> <leader>fd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>

" caller
nn <silent> <leader>fc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> <leader>fC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> <leader>fmv :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> <leader>fmf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> <leader>fmt :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nn <silent> <leader>fv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> <leader>fV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

" Remap keys for gotos
nmap <silent> <leader>gf <Plug>(coc-definition)
nmap <silent> <leader>gd <Plug>(coc-declaration)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gs :call CocAction('showSignatureHelp')<cr>
nmap <silent> <leader>fr <Plug>(coc-references)
nmap <silent> <leader>fa :<C-u>CocList -I -S -R symbols<cr>
nmap <silent> <leader>fs :call CocAction('documentSymbols')<cr>

nn <silent><C-p> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>

" Remap for rename current word
nmap <leader>mv <Plug>(coc-rename)

nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>

" Use <leader>h to show documentation in preview window
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Map <tab> for trigger completion, completion confirm, snippet expand and jump
" like VSCode. >
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

let g:coc_snippet_next = '<tab>'
" Note: the `coc-snippets` extension is required for this to work.


" To make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, use: >
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)


" Remap for format selected region
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
