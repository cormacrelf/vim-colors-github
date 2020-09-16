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
        let base0      = s:getGHColor('ghBase0')
        let base1      = s:getGHColor('ghBase1')
        let base3      = s:getGHColor('ghBase3')
        let base4      = s:getGHColor('ghBase4')
        let grey0      = s:getGHColor('ghGrey0')
        let grey1      = s:getGHColor('ghGrey1')
        let grey2      = s:getGHColor('ghGrey2')
        let background = s:getGHColor('ghBackground')
 
        let yellow     = s:getGHColor('ghYellow')
        let blue       = s:getGHColor('ghBlue')
        let darkblue   = s:getGHColor('ghDarkBlue')
        let blue2      = s:getGHColor('ghBlue2')
        let blue3      = s:getGHColor('ghBlue3')
        let blue4      = s:getGHColor('ghBlue4')
        let red        = s:getGHColor('ghRed')
        let darkred    = s:getGHColor('ghDarkRed')
        let orange     = s:getGHColor('ghOrange')
        let purple     = s:getGHColor('ghPurple')
        " }}}

        let flatten = [ base0, grey1 ]
        let below = [ base1, grey2 ]

        let p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}}
        let p.normal.left = [ [ grey2, base0, 'bold' ], flatten ]
        let p.normal.right = [ [ grey2, base1 ], flatten ]
        let p.normal.middle = [ below ]
        let p.inactive.right = [ [ base3, grey2 ], [ base3, grey2 ] ]
        let p.inactive.left =  [ [ base3, grey2 ], [ base3, grey2 ] ]
        let p.inactive.middle = [ [ base3, grey2 ] ]
        " let insert2 = [ [ base0, blue3 ] ]
        " let p.insert.middle = [ [ base0, blue4 ] ]
        let p.insert.left = [ [ grey2, blue, 'bold' ], flatten ]
        let p.insert.right = [ [ grey2, blue ], flatten ]
        let p.insert.middle = [ flatten ]
        let p.terminal.left = [ [ grey2, darkblue, 'bold' ], flatten ]
        let p.terminal.right = [ [ grey2, darkblue ], flatten ]
        let p.terminal.middle = [ flatten ]
        let p.replace.left = [ [ grey2, red, 'bold' ], flatten ]
        let p.replace.right = [ [ grey2, red ], flatten ]
        let p.replace.middle = [ flatten ]
        let p.visual.left = [ [ grey2, purple, 'bold' ], flatten ]
        let p.visual.right = [ [ grey2, purple ], flatten ]
        let p.visual.middle = [ flatten ]
        let p.tabline.left = [ [ base0, grey1 ] ]
        let p.tabline.tabsel = [ [ base0, background, 'bold' ] ]
        let p.tabline.middle = [ [ grey0, grey0 ] ]
        let p.tabline.right = [ [ base0, orange ] ]
        let p.normal.error = [ [ base1, orange ] ]
        let p.normal.warning = [ [ base1, yellow ] ]
        return lightline#colorscheme#flatten(p)
    endif
    return {}
endfunc

" use g: so it isn't treated as a constant
let g:lightline#colorscheme#github#palette = lightline#colorscheme#github#compute()

