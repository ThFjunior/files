function! Set_nu()
    " This function sets numbering of lines to help files
    if getbufvar(bufnr('%'), "&filetype") == 'help'
        :set number
    endif
endfunction
