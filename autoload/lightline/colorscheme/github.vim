" vim:foldmethod=marker:foldlevel=0:foldenable:
" -----------------------------------------------------------------------------
" Description: GitHub colorscheme for Lightline (itchyny/lightline.vim)
" Author: Cormac Relf <web@cormacrelf.net>
" Source: Originally adapted from http//github.com/morhetz/gruvbox
" -----------------------------------------------------------------------------

" {{{ color getter fns
func! s:getGHColor(group)
    let guiColor = synIDattr(hlID(a:group), "fg", "gui")
    let termColor = synIDattr(hlID(a:group), "fg", "cterm")
    return [ guiColor, termColor ]
endfunc
"}}}

func! lightline#colorscheme#github#compute()
    if exists('g:lightline')
        " import colors from scheme {{{
        let s:base0      = s:getGHColor('ghBase0')
        let s:base1      = s:getGHColor('ghBase1')
        let s:base3      = s:getGHColor('ghBase3')
        let s:base4      = s:getGHColor('ghBase4')
        let s:grey0      = s:getGHColor('ghGrey0')
        let s:grey1      = s:getGHColor('ghGrey1')
        let s:grey2      = s:getGHColor('ghGrey2')
        let s:background = s:getGHColor('ghBackground')
 
        let s:yellow     = s:getGHColor('ghYellow')
        let s:blue       = s:getGHColor('ghBlue')
        let s:darkblue   = s:getGHColor('ghDarkBlue')
        let s:blue2      = s:getGHColor('ghBlue2')
        let s:blue3      = s:getGHColor('ghBlue3')
        let s:blue4      = s:getGHColor('ghBlue4')
        let s:red        = s:getGHColor('ghRed')
        let s:darkred    = s:getGHColor('ghDarkRed')
        let s:orange     = s:getGHColor('ghOrange')
        let s:purple     = s:getGHColor('ghPurple')
        " }}}

        let s:flatten = [ s:base0, s:grey0 ]
        let s:below = [ s:base1, s:grey2 ]

        let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}}
        let s:p.normal.left = [ [ s:grey2, s:base1, 'bold' ], s:flatten ]
        let s:p.normal.right = [ [ s:grey2, s:base1 ], s:flatten ]
        let s:p.normal.middle = [ s:below ]
        let s:p.inactive.right = [ [ s:base3, s:grey2 ], [ s:base3, s:grey2 ] ]
        let s:p.inactive.left =  [ [ s:base3, s:grey2 ], [ s:base3, s:grey2 ] ]
        let s:p.inactive.middle = [ [ s:base3, s:grey2 ] ]
        " let insert2 = [ [ s:base0, s:blue3 ] ]
        " let s:p.insert.middle = [ [ s:base0, s:blue4 ] ]
        let s:p.insert.left = [ [ s:grey2, s:blue, 'bold' ], s:flatten ]
        let s:p.insert.right = [ [ s:grey2, s:blue ], s:flatten ]
        let s:p.insert.middle = [ s:flatten ]
        let s:p.terminal.left = [ [ s:grey2, s:darkblue, 'bold' ], s:flatten ]
        let s:p.terminal.right = [ [ s:grey2, s:darkblue ], s:flatten ]
        let s:p.terminal.middle = [ s:flatten ]
        let s:p.replace.left = [ [ s:grey2, s:red, 'bold' ], s:flatten ]
        let s:p.replace.right = [ [ s:grey2, s:red ], s:flatten ]
        let s:p.replace.middle = [ s:below ]
        let s:p.visual.left = [ [ s:grey2, s:purple, 'bold' ], s:flatten ]
        let s:p.visual.right = [ [ s:grey2, s:purple ], s:flatten ]
        let s:p.visual.middle = [ s:below ]
        let s:p.tabline.left = [ [ s:base0, s:grey1 ] ]
        let s:p.tabline.tabsel = [ [ s:base0, s:background, 'bold' ] ]
        let s:p.tabline.middle = [ [ s:grey0, s:grey0 ] ]
        let s:p.tabline.right = [ [ s:base0, s:orange ] ]
        let s:p.normal.error = [ [ s:base1, s:orange ] ]
        let s:p.normal.warning = [ [ s:base1, s:yellow ] ]
        return lightline#colorscheme#flatten(s:p)
    endif
    return {}
endfunc

" use g: so it isn't treated as a constant
let g:lightline#colorscheme#github#palette = lightline#colorscheme#github#compute()

