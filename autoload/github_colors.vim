if exists("g:github_loaded_togglebg")
    finish
endif
let g:github_loaded_togglebg = 1

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

" Toggle Background
" Author:       Ethan Schoonover
" License:      OSI approved MIT license

" noremap is a bit misleading here if you are unused to vim mapping.
" in fact, there is remapping, but only of script locally defined remaps, in 
" this case <SID>TogBG. The <script> argument modifies the noremap scope in 
" this regard (and the noremenu below).
nnoremap <unique> <script> <Plug>GithubToggleBackground <SID>TogBG
inoremap <unique> <script> <Plug>GithubToggleBackground <ESC><SID>TogBG<ESC>a
vnoremap <unique> <script> <Plug>GithubToggleBackground <ESC><SID>TogBG<ESC>gv
nnoremenu <script> Window.Toggle\ Background <SID>TogBG
inoremenu <script> Window.Toggle\ Background <ESC><SID>TogBG<ESC>a
vnoremenu <script> Window.Toggle\ Background <ESC><SID>TogBG<ESC>gv
tmenu Window.Toggle\ Background Toggle light and dark background modes
nnoremenu <script> ToolBar.togglebg <SID>TogBG
inoremenu <script> ToolBar.togglebg <ESC><SID>TogBG<ESC>a
vnoremenu <script> ToolBar.togglebg <ESC><SID>TogBG<ESC>gv
tmenu ToolBar.togglebg Toggle light and dark background modes
noremap <SID>TogBG  :call <SID>TogBG()<CR>

function! s:TogBG() abort
  let &background = ( &background ==# 'dark'? 'light' : 'dark' )
  if exists('g:loaded_lightline') && g:colors_name =~# 'github'
    execute 'source ' . g:plug_home . '/vim-colors-github/autoload/lightline/colorscheme/github.vim'
    windo call lightline#colorscheme()
  elseif exists('g:colors_name')
    exe 'colorscheme ' . g:colors_name
  endif
endfunction

if !exists(":GithubToggleBG")
    command GithubToggleBG :call s:TogBG()
endif

function! GithubToggleBackground()
    echo "Please update your GithubToggleBackground mapping. ':help togglebg' for information."
endfunction

function! github_colors#togglebg_map(mapActivation)
    try
        exe "silent! nmap <unique> ".a:mapActivation." <Plug>GithubToggleBackground"
        exe "silent! imap <unique> ".a:mapActivation." <Plug>GithubToggleBackground"
        exe "silent! vmap <unique> ".a:mapActivation." <Plug>GithubToggleBackground"
    finally
        return 0
    endtry
endfunction

if !exists("no_plugin_maps") && !hasmapto('<Plug>GithubToggleBackground')
    call github_colors#togglebg_map("<F5>")
endif

