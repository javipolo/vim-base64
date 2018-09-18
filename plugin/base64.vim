function! Base64ne(type)
    if a:type ==# 'v'
        " We are in visual character mode
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        " We are in normal mode
        execute "normal! `[v`]y"
    else
        return
    endif
    let cmd = "base64 --wrap=0 - 2>/dev/null"
    let base64 = split(system(cmd, @@),'\v\n')[0]
    if a:type ==# 'v'
        execute "normal! `<v`>s".base64
        execute "normal! `<"
    elseif a:type ==# 'char'
        execute "normal! `[v`]s".base64
        execute "normal! `["
    endif
endfunction
    
function! Base64nd(type)
    if a:type ==# 'v'
        " We are in visual character mode
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        " We are in normal mode
        execute "normal! `[v`]y"
    else
        return
    endif
    let cmd = "base64 --decode --ignore-garbage --wrap=0 - 2>/dev/null"
    let base64 = split(system(cmd, @@),'\v\n')[0]
    if a:type ==# 'v'
        execute "normal! `<v`>s".base64
        execute "normal! `<"
    elseif a:type ==# 'char'
        execute "normal! `[v`]s".base64
        execute "normal! `["
    endif
endfunction

nnoremap <silent> <leader>be :set operatorfunc=Base64ne<cr>g@
nnoremap <silent> <leader>bd :set operatorfunc=Base64nd<cr>g@
