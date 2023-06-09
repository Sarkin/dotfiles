" Coc configs
" bases
nn <silent> <leader>fw :call CocLocations('clangd','textDocument/references',{})<cr>
nn <silent> <leader>fr :call CocLocations('clangd','textDocument/references',{})<cr>
" Remap keys for gotos
nmap <silent> <leader>gf <Plug>(coc-definition)
nmap <silent> <leader>gd <Plug>(coc-declaration)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>ff <Plug>(coc-references)
nmap <silent> <leader>gs :call CocAction('showSignatureHelp')<cr>
nmap <silent> <leader>fa :<C-u>CocList -I -S -R symbols<cr>
nmap <silent> <leader>fs :call CocAction('documentSymbols')<cr>

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

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Remap for format selected region
xmap <leader>= <Plug>(coc-format-selected)
nmap <leader>= <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
