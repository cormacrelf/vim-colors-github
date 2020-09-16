" vim: set foldmethod=marker foldlevel=1 :
" {{{ Preamble & vars
"
" Author:   Cormac Relf <web@cormacrelf.net>
"
" Note:     Based on github's syntax highlighting theme as of 2018.
"           Originally based on https://github.com/endel/vim-github-colorscheme,
"           but none of that code remains.
"
" Usage:    colorscheme github
"           " optional, if you use airline
"           let g:airline_theme = "github"

hi clear
if exists("syntax_on")
    syntax reset
endif

if !exists("g:github_colors_extra_functions")
  let g:github_colors_extra_functions = 1
endif

if !exists("g:github_colors_soft")
  let g:github_colors_soft = 0
endif

if !exists("g:github_colors_block_diffmark")
  let g:github_colors_block_diffmark = 0
endif

let colors_name = "github"

let s:is_dark=(&background == 'dark')

" Helper functions {{{
" from vim-gotham

function! s:Highlight(args)
  exec 'highlight ' . join(a:args, ' ')
endfunction

function! s:AddGroundValues(accumulator, ground, color)
  let new_list = a:accumulator
  for [where, value] in items(a:color)
    call add(new_list, where . a:ground . '=' . value)
  endfor

  return new_list
endfunction

function! s:Col(group, fg_name, ...)
  " ... = optional bg_name

  let pieces = [a:group]

  if a:fg_name !=# ''
    let pieces = s:AddGroundValues(pieces, 'fg', s:colors[a:fg_name])
  endif

  if a:0 > 0 && a:1 !=# ''
    let pieces = s:AddGroundValues(pieces, 'bg', s:colors[a:1])
  endif

  call s:Clear(a:group)
  call s:Highlight(pieces)
endfunction

function! s:Attr(group, attr)
  let l:attrs = [a:group, 'term=' . a:attr, 'cterm=' . a:attr, 'gui=' . a:attr]
  call s:Highlight(l:attrs)
endfunction

function! s:Spell(group, attr)
  let l:attrs = [a:group, 'guisp=' . s:colors[a:attr].gui ]
  call s:Highlight(l:attrs)
endfunction


function! s:Clear(group)
  exec 'highlight clear ' . a:group
endfunction

" }}}
" }}}

" Colors {{{

let s:lib = {}    " to build s:colors from, not to be used directly
let s:colors = {} " the 'stable API' you can access through s:Col

" color docs
" --light mode --------------- dark mode
"   base0 = dark text fg     | lightest text fg
"   base1 = dark solid       | light solid
"   base2 = comment
"   base3 = darker gutter fg
"   base4 = normal gutter fg
"   grey0 = ui grey darker   | ui grey lighter
"   grey1 = ui grey medium   | ui grey medium
"   grey2 = ui grey bright   | ui grey dark
"   gutter = linenr bg
"   overlay = overlay background
"   bg = bg
"   visualblue = for visual selections
"   lightblue  = for folds

let s:lib.numDarkest = { 'gui': '#76787b', 'cterm': 243 }
let s:lib.numMedium  = { 'gui': '#979797', 'cterm': 246 }
let s:lib.numLighter = { 'gui': '#babbbc', 'cterm': 250 }
let s:lib.c8d1db     = { 'gui': '#C8D1DB', 'cterm': 252 }
let s:lib.d7dce1     = { 'gui': '#d7dce1', 'cterm': 253 }
let s:lib.dde2e7     = { 'gui': '#C8CED6', 'cterm': 254 }
let s:lib.e0e7ef     = { 'gui': '#e0e7ef', 'cterm': 254 }
let s:lib.ebeced     = { 'gui': '#ebeced', 'cterm': 255 }
let s:lib.eceef1     = { 'gui': '#ECEEF1', 'cterm': 255 }
let s:lib.eaeff4     = { 'gui': '#eaeff4', 'cterm': 255 }
let s:lib.f1f2f3     = { 'gui': '#f1f2f4', 'cterm': 255 }
let s:lib.f6f8fa     = { 'gui': '#f6f8fa', 'cterm': 255 } " github inline code block bg
let s:lib.fafbfc     = { 'gui': '#fafbfc', 'cterm': 255 } " github generic light
let s:lib.white      = { 'gui': '#ffffff', 'cterm': 231 }
let s:lib.base0      = { 'gui': '#24292e', 'cterm': 235 } " github text fg
let s:lib.base05     = { 'gui': '#2b3137', 'cterm': 238 } " lightened from 0
let s:lib.base05     = { 'gui': '#2d343a', 'cterm': 238 } " lightened from 0
let s:lib.base1      = { 'gui': '#41484f', 'cterm': 238 } " lightened from 0
let s:lib.base2      = { 'gui': '#6a737d', 'cterm': 243 } " github comment
let s:lib.base3      = s:lib.numDarkest

let s:lib.darktext     = [
      \{ 'gui': '#fafbfc', 'cterm': 255 },
      \{ 'gui': '#d2d4d6', 'cterm': 254 },
      \{ 'gui': '#abaeb1', 'cterm': 251 },
      \{ 'gui': '#868a8e', 'cterm': 251 },
      \{ 'gui': '#63686c', 'cterm': 251 },
      \{ 'gui': '#42474c', 'cterm': 251 },
      \s:lib.base0
      \]

" actual colorful colors {{{
let s:colors.red            = { 'gui': '#d73a49', 'cterm': 167 } " github syntax
let s:colors.darkred        = { 'gui': '#b31d28', 'cterm': 124 } " github syntax
let s:colors.purple         = { 'gui': '#6f42c1', 'cterm': 91  } " github syntax
let s:colors.darkpurple     = { 'gui': '#45267d', 'cterm': 237 } " ^- darkened
let s:colors.yellow         = { 'gui': '#ffffc5', 'cterm': 230 } " github search
let s:colors.green          = { 'gui': '#22863a', 'cterm': 29  } " github syntax (html)
let s:colors.boldgreen      = { 'gui': '#3ebc5c', 'cterm': 29  } " ^
let s:colors.orange         = { 'gui': '#e36209', 'cterm': 166 } " github syntax
let s:colors.boldorange     = { 'gui': '#f18338', 'cterm': 166 } " ^
let s:colors.lightgreen_nr  = { 'gui': '#cdffd8', 'cterm': 85  } " github diff
let s:colors.lightgreen     = { 'gui': '#e6ffed', 'cterm': 85  } " github diff
let s:colors.lightred_nr    = { 'gui': '#ffdce0', 'cterm': 167 } " github diff
let s:colors.lightred       = { 'gui': '#ffeef0', 'cterm': 167 } " github diff
let s:colors.lightorange_nr = { 'gui': '#fff5b1', 'cterm': 229 } " github selected line number column
let s:colors.lightorange    = { 'gui': '#fffbdd', 'cterm': 230 } " github selected line
let s:colors.difftext       = { 'gui': '#f2e496', 'cterm': 222 } " ^- darkened
let s:colors.darkblue       = { 'gui': '#032f62', 'cterm': 17  } " ^- darkened
let s:colors.blue           = { 'gui': '#005cc5', 'cterm': 26  } " github syntax
let s:colors.blue0          = { 'gui': '#669cc2', 'cterm': 153 }
let s:colors.blue1          = { 'gui': '#c1daec', 'cterm': 153 }
let s:colors.blue2          = { 'gui': '#e4effb', 'cterm': 153 }
let s:colors.blue3          = { 'gui': '#bde0fb', 'cterm': 153 }
let s:colors.blue4          = { 'gui': '#f1f8ff', 'cterm': 153 } " github diff folds
let s:colors.errorred       = { 'gui': '#b74951', 'cterm': 167 } " from darkred

let s:darklib = {}
let s:darklib.blues = ['#5295d4', '#4c81b5', '#456e98', '#3d5c7b', '#354a60', '#2d3846', '#23282d']

let s:dcolors = {}
let s:dcolors.red            = { 'gui': '#f16636', 'cterm': 167 }
let s:dcolors.blue           = { 'gui': '#4dacfd', 'cterm': 167 }
let s:dcolors.purple         = { 'gui': '#a280e2', 'cterm': 91  }
let s:dcolors.purple         = { 'gui': '#a887e6', 'cterm': 91  }
let s:dcolors.darkpurple     = { 'gui': '#8b71c1', 'cterm': 91  }
let s:dcolors.darkblue       = { 'gui': '#aacce4', 'cterm': 167 }
let s:dcolors.darkblue       = s:colors.blue1
let s:dcolors.blue0          = { 'gui': s:darklib.blues[2], 'cterm': 153 }
let s:dcolors.blue1          = { 'gui': s:darklib.blues[5], 'cterm': 153 }
let s:dcolors.blue2          = { 'gui': s:darklib.blues[4], 'cterm': 153 }
let s:dcolors.blue3          = { 'gui': s:darklib.blues[5], 'cterm': 153 }
let s:dcolors.lightorange    = { 'gui': '#49443e', 'cterm': 150 }
let s:dcolors.difftext       = { 'gui': '#87663b', 'cterm': 150 }
let s:dcolors.lightorange_nr = { 'gui': '#6f6456', 'cterm': 150 }
let s:dcolors.lightgreen_nr  = { 'gui': '#5d8c6f', 'cterm': 85  } " github diff
let s:dcolors.lightgreen     = { 'gui': '#374843', 'cterm': 85  } " github diff
let s:dcolors.lightred_nr    = { 'gui': '#8b6c73', 'cterm': 167 } " github diff
let s:dcolors.lightred       = { 'gui': '#443e44', 'cterm': 167 } " github diff
let s:dcolors.overlay        = { 'gui': '#353a3f', 'cterm': 123 }
let s:dcolors.yellow         = { 'gui': '#595322', 'cterm': 230 } " github search
let s:dcolors.green          = { 'gui': '#59b36f', 'cterm': 29  } " github syntax (html)

" }}}

if s:is_dark 
  for pkey in keys(s:dcolors)
    let s:colors[pkey] = s:dcolors[pkey]
  endfor
  " base0 is now darkest
  let s:colors.base0        = s:lib.darktext[0]
  let s:colors.base1        = s:lib.darktext[1]
  let s:colors.base2        = s:lib.darktext[2]
  let s:colors.base3        = s:lib.darktext[3]
  let s:colors.base4        = s:lib.numDarkest

  let s:colors.grey0        = s:lib.base3
  let s:colors.grey1        = s:lib.base2
  let s:colors.grey2        = s:lib.base1

  let s:colors.uisplit      = s:lib.base2
  let s:colors.bg           = s:lib.base0
  let s:colors.fg           = s:lib.fafbfc
  let s:colors.gutter       = s:lib.base05
  let s:colors.endofbuf     = s:lib.base05
  let s:colors.gutterfg     = s:colors.base2
  let s:colors.lightblue    = s:dcolors.blue1
  let s:colors.visualblue   = s:dcolors.blue2
else
  let s:colors.base0          = s:lib.base0
  let s:colors.base1          = s:lib.base1
  let s:colors.base2          = s:lib.base2
  let s:colors.base3          = s:lib.base3
  let s:colors.fg             = s:colors.base0
  let s:colors.gutterfg       = s:colors.base3

  if g:github_colors_soft == 0
      let s:colors.grey0      = s:lib.dde2e7
      let s:colors.grey1      = s:lib.eceef1
      let s:colors.grey2      = s:lib.f6f8fa
      let s:colors.overlay    = s:lib.f6f8fa
      let s:colors.gutter     = s:lib.fafbfc
      let s:colors.endofbuf   = s:colors.gutter " same
      let s:colors.bg         = s:lib.white
      let s:colors.base4      = s:lib.numLighter
      let s:colors.visualblue = s:colors.blue2
      let s:colors.lightblue  = s:colors.blue4
  else
      let s:colors.grey0      = s:lib.c8d1db
      let s:colors.grey1      = s:lib.dde2e7
      let s:colors.grey2      = s:lib.e0e7ef
      let s:colors.gutter     = s:lib.eaeff4
      let s:colors.endofbuf   = s:colors.gutter " same
      let s:colors.bg         = s:lib.f6f8fa
      let s:colors.overlay    = s:lib.white
      let s:colors.base4      = s:lib.numMedium
      let s:colors.visualblue = s:colors.blue1
      let s:colors.lightblue  = s:colors.blue2
  endif
  let s:colors.uisplit        = s:colors.grey1
endif

" named groups to link to {{{
call s:Col('ghBackground', 'bg')
call s:Col('ghBlack', 'base0')
call s:Col('ghBase0', 'base0')
call s:Col('ghBase1', 'base1')
call s:Col('ghBase2', 'base2')
call s:Col('ghBase3', 'base3')
call s:Col('ghBase4', 'base4')
call s:Col('ghGrey0', 'grey0')
call s:Col('ghGrey1', 'grey1')
call s:Col('ghGrey2', 'grey2')
call s:Col('ghGreen', 'green')
call s:Col('ghBlue', 'blue')
call s:Col('ghBlue2', 'blue2')
call s:Col('ghBlue3', 'blue3')
call s:Col('ghBlue4', 'blue4')
call s:Col('ghDarkBlue', 'darkblue')
call s:Col('ghRed', 'red')
call s:Col('ghDarkRed', 'darkred')
call s:Col('ghPurple', 'purple')
call s:Col('ghDarkPurple', 'darkpurple')
call s:Col('ghOrange', 'orange')
call s:Col('ghLightOrange', 'lightorange')
call s:Col('ghYellow', 'yellow')
call s:Col('ghLightRed', 'lightred')
call s:Col('ghOver', 'overlay')
call s:Col('ghUISplit', 'uisplit')
" }}}

" }}}

" UI colors {{{

call s:Col('Normal', 'fg', 'bg')
call s:Col('Cursor', 'bg', 'fg')    " only if vim gets to render cursor
call s:Col('Visual', '', 'visualblue')
call s:Col('VisualNOS', '', 'lightblue')
call s:Col('Search', '', 'yellow') | call s:Attr('Search', 'bold')
call s:Col('Whitespace', 'base4', 'bg')   " listchars spaces, tab, ...
call s:Col('NonText',    'base4', 'bg')   " listchars eol
call s:Col('SpecialKey', 'base4', 'bg')
call s:Col('Conceal',    'red')

call s:Col('MatchParen', 'darkblue', 'blue3')
" | call s:Attr('MatchParen', 'bold')
call s:Col('WarningMsg', 'orange')
call s:Col('ErrorMsg', 'errorred')
" TODO: fix error in light mode
call s:Col('Error', 'gutterfg', 'errorred')
call s:Col('Title', 'base1')
call s:Attr('Title', 'bold')

call s:Col('VertSplit',    'uisplit', 'uisplit')
call s:Col('LineNr',       'base4',  'gutter')
hi! link     SignColumn       LineNr
call s:Col('EndOfBuffer',  'base4',  'endofbuf')
call s:Col('ColorColumn',  '',       'grey2')

call s:Col('CursorLineNR', 'gutterfg',  'lightorange_nr')
call s:Col('CursorLine',   '',       'lightorange')
call s:Col('CursorColumn', '',       'lightorange')

call s:Col('QuickFixLine', '', 'blue3') | call s:Attr('QuickFixLine', 'bold')
call s:Col('qfLineNr', 'gutterfg', 'gutter')

call s:Col('Folded',     'gutterfg', 'lightblue')
call s:Col('FoldColumn', 'blue0', 'gutter')

call s:Col('StatusLine',      'grey2', 'base0')
call s:Col('StatusLineNC',    'gutterfg', 'grey1')
" statusline determines inactive wildmenu entries too
call s:Col('WildMenu', 'grey2', 'blue')

call s:Col('airlineN1',       'grey1', 'base0')
call s:Col('airlineN2',       'grey1', 'base1')
call s:Col('airlineN3',       'base0',  'grey1')
call s:Col('airlineInsert1',  'grey1', 'blue')
call s:Col('airlineInsert2',  'grey1', 'darkblue')
call s:Col('airlineVisual1',  'grey1', 'purple')
call s:Col('airlineVisual2',  'grey1', 'darkpurple')
call s:Col('airlineReplace1', 'grey1', 'red')
call s:Col('airlineReplace2', 'grey1', 'darkred')

call s:Col('Pmenu',      'base3', 'overlay')
call s:Col('PmenuSel',   'overlay',  'blue') | call s:Attr('PmenuSel', 'bold')
call s:Col('PmenuSbar',  '',      'grey2')
call s:Col('PmenuThumb', '',      'grey0')


" hit enter to continue
call s:Col('Question', 'green')

call s:Col('TabLine',     'base1', 'grey1') | call s:Attr('TabLine', 'none')
call s:Col('TabLineFill', 'base0', 'base0') | call s:Attr('TabLineFill', 'none')
call s:Col('TabLineFill', 'grey0', 'grey0') | call s:Attr('TabLineFill', 'none')
call s:Col('TabLineSel',  'base1'         ) | call s:Attr('TabLineSel', 'bold')

call s:Col('DiffAdd',    '', 'lightgreen')
call s:Col('DiffDelete', 'base4', 'lightred') | call s:Attr('DiffDelete', 'none')
call s:Col('DiffChange', '', 'lightorange')
call s:Col('DiffText',   '', 'difftext')

" nvim :terminal mode
if has('nvim')
  let g:terminal_color_0 = s:colors.base4.gui
  let g:terminal_color_8 = s:colors.base3.gui

  let g:terminal_color_1 = s:colors.red.gui
  let g:terminal_color_9 = s:colors.darkred.gui

  let g:terminal_color_2 = s:colors.boldgreen.gui
  let g:terminal_color_10 = s:colors.green.gui

  let g:terminal_color_3 = s:colors.boldorange.gui
  let g:terminal_color_11 = s:colors.orange.gui

  let g:terminal_color_4 = s:colors.blue.gui
  let g:terminal_color_12 = s:colors.darkblue.gui

  let g:terminal_color_5 = s:colors.purple.gui
  let g:terminal_color_13 = s:colors.darkpurple.gui

  " should be "cyan", but this is good enough
  let g:terminal_color_6 = s:colors.blue.gui
  let g:terminal_color_14 = s:colors.darkblue.gui

  let g:terminal_color_7 = s:colors.base1.gui
  let g:terminal_color_15 = s:colors.base0.gui
endif

" Park this for later
" https://terminal.sexy/#9vj6JCkuKCousx0oL4tF7Y1LAy9iRSZ9XL32yNHbNztB1zpJPrxc8YM4AFzFb0LBMuD73eLn
" let @k = "\<c-w>l:so $VIM_INIT\<cr>:bd!\<cr>:vspl\<cr>:term\<cr>Afish\<cr>colortest.sh\<cr>ls\<cr>\<esc>\<c-w>h"

" }}}

" {{{ Syntax highlighting

call s:Clear('Ignore') | call s:Col('Ignore', 'base4', 'bg')
call s:Col('Identifier', 'blue')
call s:Col('PreProc', 'red')
call s:Col('Macro', 'blue')
call s:Col('Define', 'purple')
call s:Col('Comment', 'base2')
call s:Col('Constant', 'blue')
call s:Col('String', 'darkblue')
call s:Col('Function', 'purple')
call s:Col('Statement', 'red')
call s:Col('Type', 'red')
call s:Col('Todo', 'purple') | call s:Attr('Todo', 'underline')
call s:Col('Special', 'purple')
call s:Col('SpecialComment', 'base0')
call s:Col('Label', 'base0')
call s:Col('StorageClass', 'red')
call s:Col('Structure', 'red')

" Particular Languages {{{

hi link cDefine Define

" html
" xml doesn't recognise xmlEndTag->xmlTagName, so colour it all green
call s:Col('xmlTag', 'green')
call s:Col('xmlEndTag', 'green')
call s:Col('xmlTagName', 'green')
call s:Col('xmlAttrib', 'purple')

call s:Col('htmlTag', 'base0')
hi link htmlEndTag  htmlTag
hi link htmlTagN    htmlTag
hi link htmlTagName xmlTagName
hi link htmlArg     xmlAttrib
hi link htmlLink    Underlined

" vim-jsx-pretty
hi link jsxTag htmlTag
hi link jsxCloseTag jsxTag
hi link jsxCloseString jsxTag
hi link jsxAttrib xmlAttrib
hi link jsxEqual Operator
hi link jsxTagName htmlTagName
call s:Col('jsxComponentName', 'blue')
" TODO: maybe make extra italics an option
" call s:Attr('jsxComponentName', 'italic')
" call s:Col('jsxAttrib', 'purple')
" call s:Attr('jsxAttrib', 'italic')

" toml
hi link tomlTable ghPurple
hi link tomlKey   ghBlack
" yaml
hi link yamlBlockMappingKey ghGreen

if g:github_colors_extra_functions == 1
  " in C, functions are blue!
  au FileType c syntax match ghBlueFunc /\w\+\s*(/me=e-1,he=e-1
  highlight def link ghBlueFunc Identifier
  au FileType typescript syntax match ghPurpleFunc /\w\+\s*(/me=e-1,he=e-1
  au FileType javascript syntax match ghPurpleFunc /\w\+\s*(/me=e-1,he=e-1
  highlight def link ghPurpleFunc Function
endif

call s:Col('ghNormalNoBg', 'fg', '')

" vimL
hi link vimHiTerm      ghBlack
hi link vimHiGroup     ghOrange
hi link vimUserFunc    ghPurple
hi link vimCommand     Statement
hi link vimNotFunc     Statement
hi link vimGroup       Statement
hi link vimHighlight   Identifier
hi link vimAutoCmd     Identifier
hi link vimAutoEvent   Identifier
hi link vimSyntax      Identifier
hi link vimSynType     Identifier
hi link vimMap         Identifier
hi link vimOption      Identifier
hi link vimUserCommand Identifier
hi link vimAugroupKey  Identifier
hi link vimParenSep    Delimiter

hi link Delimiter         ghNormalNoBg
hi link SpecialComment    Comment
hi link Character         Number
hi link CursorIM          Cursor
hi link cppSTL            Function
hi link cppSTLType        Type
hi link shDeref           Identifier
hi link shVariable        Function
hi link perlSharpBang     Special
hi link schemeFunc        Statement

" typescript
hi link typescriptBraces  ghBlack
hi link typescriptBraces  ghBlack
hi link typescriptParens  ghBlack

" ruby
hi link rubySharpBang     Special
hi link rubyDefine        PreProc
hi link rubyClass         PreProc
hi link rubyConstant      Define
hi link rubyInclude       PreProc

" python
hi link pythonBuiltin     Identifier

" fatih/vim-go
" you can enable more highlights from :h go-syntax
hi link goConstants       Constant
hi link goFunctionCall    Identifier

" rust
hi link rustModPath       Define
hi link rustIdentifier    Function
hi link rustAttribute     ghBase0
hi link rustDerive        rustAttribute
hi link rustDeriveTrait   ghDarkPurple
hi link rustCommentLineDoc ghBase2

" neovimhaskell/haskell-vim
hi link haskellIdentifier Function
hi link haskellType       Identifier

" diff (language)
call s:Col('diffFile',      'base0',    'grey2')
call s:Col('diffNewFile',   'base0',    'grey2')
call s:Col('diffIndexLine', 'darkblue', 'grey2')
call s:Col('diffLine',      'base2',    'lightblue')
call s:Col('diffSubname',   'darkblue', 'lightblue')
call s:Col('diffAdded',     'green',    'lightgreen')
call s:Col('diffRemoved',   'red',      'lightred')

" vim-pandoc-syntax
call s:Col('pandocAtxStart', 'base4')
call s:Col('pandocOperator', 'red')
call s:Col('pandocDelimitedCodeBlock', 'darkpurple')
call s:Col('pandocNoFormatted', 'base0', 'gutter')
call s:Col('pandocPCite', 'purple')
call s:Col('pandocCitekey', 'purple')

" tex
call s:Col('texMath', 'blue')
call s:Col('texStatement', 'red')
call s:Col('texType', 'purple')
hi link texSection Title

" plain builtin markdown
hi link htmlH Title
hi link markdownListMarker pandocOperator
hi link markdownCode pandocDelimitedCodeBlock
hi link markdownRule Title
hi link markdownHeadingDelimiter pandocAtxStart

" clojure
hi link clojureDefine Type
hi link clojureKeyword Identifier
hi link clojureMacro ghPurple

" }}}

" Plugin Support {{{

" GitGutter
if g:github_colors_block_diffmark == 0
  call s:Col('GitGutterAdd',          'green', 'gutter')
  call s:Col('GitGutterChange',       'orange', 'gutter')
  call s:Col('GitGutterDelete',       'darkred', 'gutter')
  call s:Col('GitGutterChangeDelete', 'orange', 'gutter')
else
  call s:Col('GitGutterAdd',          'gutterfg', 'lightgreen_nr')
  call s:Col('GitGutterChange',       'gutterfg', 'lightorange_nr')
  call s:Col('GitGutterDelete',       'gutterfg', 'lightred_nr')
  call s:Col('GitGutterChangeDelete', 'red', 'lightorange_nr')
endif

" NERDTree
hi link NERDTreeDir       ghBlue
hi link NERDTreeCWD       ghRed
hi link NERDTreeExecFile  ghPurple
hi link NERDTreeFile      ghDarkBlue

" Startify
call s:Clear('Directory') " somehow it's linked to 'Blue' + bold?
hi link Directory         ghBlue
hi link StartifyPath      ghBlue
hi link StartifyHeader    ghBlue

call s:Col('ghSneak', 'bg', 'purple')
call s:Col('ghOverBg', '',  'overlay')
" vim-sneak
hi link Sneak             ghSneak
hi link SneakScope        ghOverBg
hi link sneakLabel        ghSneak

" fzf
" + means the selected one
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Comment'],
  \ 'bg':      ['fg', 'ghOver'],
  \ 'hl':      ['fg', 'ghBlue'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine'],
  \ 'hl+':     ['fg', 'ghBlue'],
  \ 'info':    ['fg', 'ghRed'],
  \ 'border':  ['fg', 'ghGrey1'],
  \ 'prompt':  ['fg', 'ghBlue'],
  \ 'pointer': ['fg', 'ghRed'],
  \ 'marker':  ['fg', 'ghPurple'],
  \ 'spinner': ['fg', 'ghDarkBlue'],
  \ 'header':  ['fg', 'ghDarkBlue'] }

" Coc
call s:Col('CocHighlightText', '', 'gutter')

call s:Col('CocErrorSign', 'gutter', 'errorred')
call s:Attr('CocErrorSign', 'bold')
call s:Col('CocErrorHighlight', '', 'lightred')
call s:Attr('CocErrorHighlight', 'underline')

call s:Col('CocWarningHighlight', '', 'lightorange')
call s:Attr('CocWarningHighlight', 'underline')
call s:Col('CocWarningSign', 'orange', 'gutter')

call s:Col('CocInfoSign', 'blue', 'gutter')
call s:Col('CocInfoHighlight', '', 'lightblue')

call s:Col('CocHintSign', 'base4', 'gutter')

" }}}

" {{{ Spelling

if has("spell")
  call s:Col('SpellBad', 'red')
  call s:Attr('SpellBad', 'undercurl')
  call s:Spell('SpellBad', 'red')
  call s:Col('SpellCap', 'green')
  call s:Attr('SpellCap', 'undercurl')
  call s:Spell('SpellCap', 'green')
  call s:Col('SpellLocal', 'purple')
  call s:Attr('SpellLocal', 'undercurl')
  call s:Spell('SpellLocal', 'yellow')
  call s:Col('SpellRare', 'purple')
  call s:Attr('SpellRare', 'undercurl')
  call s:Spell('SpellRare', 'purple')
endif

" }}}

" }}}

