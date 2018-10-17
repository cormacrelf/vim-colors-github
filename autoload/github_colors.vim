func! github_colors#toggle_soft()
    if g:github_colors_soft == 0
        let g:github_colors_soft = 1
    else
        let g:github_colors_soft = 0
    endif
    colors github
    " call lightline#colorscheme#github#refresh()
    let g:lightline#colorscheme#github#palette = lightline#colorscheme#github#compute()
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunc
