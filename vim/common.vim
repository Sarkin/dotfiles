" Repeatedly hit <c-o> until the file changes
function! common#GoBackToRecentBuffer()
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
function! common#GoForwardToRecentBuffer()
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

