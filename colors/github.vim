" vim: set foldmethod=marker :
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
"           

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "github"

if !exists("g:github_colors_extra_functions")
  let g:github_colors_extra_functions = 1
endif

if !exists("g:github_colors_soft")
  let g:github_colors_soft = 0
endif

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
  let l:attrs = [a:group, 'guisp=' . a:attr]
  call s:Highlight(l:attrs)
endfunction


function! s:Clear(group)
  exec 'highlight clear ' . a:group
endfunction

" }}}

" Colors {{{

" let's store colors in a dictionary

let s:colors = {}

let s:colors.base0          = { 'gui': '#24292e', 'cterm': 235 } " github text fg
let s:colors.base1          = { 'gui': '#41484f', 'cterm': 238 } " lightened from 0
let s:colors.base2          = { 'gui': '#6a737d', 'cterm': 243 } " comment
let s:colors.base3          = { 'gui': '#76787b', 'cterm': 243 } " github linenr darker
let s:colors.base_35        = { 'gui': '#979797', 'cterm': 246 } " github linenr darker
let s:colors.base4          = { 'gui': '#babbbc', 'cterm': 250 } " github linenr lighter
let s:colors.base5          = { 'gui': '#dddddd', 'cterm': 253 } "
let s:colors.base6          = { 'gui': '#ebeced', 'cterm': 255 } " 
let s:colors.base7          = { 'gui': '#f6f8fa', 'cterm': 231 } " github inline code block bg
let s:colors.base8          = { 'gui': '#fafbfc', 'cterm': 231 } " github generic light
let s:colors.white          = { 'gui': '#ffffff', 'cterm': 231 } "

if g:github_colors_soft == 1
    let s:colors.bg         = s:colors.base7
    let s:colors.uiline     = s:colors.base5
    let s:colors.over       = s:colors.white
    let s:colors.gutter     = s:colors.base6
    let s:colors.gutterfg   = s:colors.base_35
else
    let s:colors.bg         = s:colors.white
    let s:colors.uiline     = s:colors.base6
    let s:colors.over       = s:colors.base7
    let s:colors.gutter     = s:colors.base8
    let s:colors.gutterfg   = s:colors.base4
endif

let s:colors.red            = { 'gui': '#d73a49', 'cterm': 167 } " github syntax
let s:colors.darkred        = { 'gui': '#b31d28', 'cterm': 124 } " github syntax
let s:colors.orange         = { 'gui': '#e36209', 'cterm': 166 } " github syntax
let s:colors.purple         = { 'gui': '#6f42c1', 'cterm': 61  } " github syntax
let s:colors.darkpurple     = { 'gui': '#352650', 'cterm': 237 } " ^- darkened
let s:colors.blue           = { 'gui': '#005cc5', 'cterm': 26  } " github syntax
let s:colors.darkblue       = { 'gui': '#032f62', 'cterm': 17  } " ^- darkened
let s:colors.yellow         = { 'gui': '#ffffc5', 'cterm': 230 } " github search
let s:colors.green          = { 'gui': '#22863a', 'cterm': 29  } " github syntax (html)
let s:colors.lightgreen     = { 'gui': '#e6ffed', 'cterm': 85  } " github diff
let s:colors.lightred       = { 'gui': '#ffeef0', 'cterm': 167 } " github diff
let s:colors.lightorange_nr = { 'gui': '#fff5b1', 'cterm': 229 } " github selected line number column
let s:colors.lightorange    = { 'gui': '#fffbdd', 'cterm': 230 } " github selected line
let s:colors.difftext       = { 'gui': '#f2e496', 'cterm': 222 } " ^- darkened
let s:colors.lightblue      = { 'gui': '#f1f8ff', 'cterm': 231 } " github diff folds
let s:colors.visualblue     = { 'gui': '#e4effb', 'cterm': 255 } " ^- darkened
let s:colors.medblue        = { 'gui': '#b2ceec', 'cterm': 153 } " ^- darkened

" to link to
call s:Col('ghGreen', 'green')
call s:Col('ghPurple', 'purple')
call s:Col('ghBlack', 'base0')
call s:Col('ghBlue', 'blue')
call s:Col('ghDarkBlue', 'darkblue')
call s:Col('ghOrange', 'orange')
call s:Col('ghRed', 'red')

" }}}

" UI colors {{{

call s:Col('Normal', 'base0', 'bg')
call s:Col('Cursor', 'base8', 'base0') " only if vim gets to render cursor
call s:Col('Visual', '', 'visualblue')
call s:Col('VisualNOS', '', 'lightblue')
call s:Col('Search', '', 'yellow') | call s:Attr('Search', 'bold')

call s:Col('MatchParen', 'base0', 'medblue')
call s:Col('Conceal', 'blue')
call s:Col('SpecialKey', 'blue') | call s:Attr('SpecialKey', 'italic')
call s:Col('WarningMsg', 'red')
call s:Col('ErrorMsg', 'darkred', 'base8')
call s:Col('Error', 'gutter', 'darkred')
call s:Col('Title', 'blue')

call s:Col('VertSplit',    'uiline', 'uiline')
call s:Col('SignColumn',   'gutterfg',  'gutter')
call s:Col('LineNr',       'gutterfg',  'gutter')
call s:Col('ColorColumn',  '',       'base5')
call s:Col('CursorLine',   '',       'lightorange')
call s:Col('CursorLineNR', 'base3',  'lightorange_nr')
hi! link CursorColumn CursorLine
" tildes at the bottom
hi! link NonText      LineNr

call s:Col('Folded', 'base3', 'lightblue')
call s:Col('FoldColumn', 'medblue', 'gutter')

call s:Col('StatusLine',      'base8', 'base0')
call s:Col('StatusLineNC',    'base3', 'gutter')
" statusline determines inactive wildmenu entries too
call s:Col('WildMenu', 'base8', 'blue')

call s:Col('airlineN1',       'uiline', 'base0')
call s:Col('airlineN2',       'uiline', 'base1')
call s:Col('airlineN3',       'base0',  'uiline')
call s:Col('airlineInsert1',  'uiline', 'blue')
call s:Col('airlineInsert2',  'uiline', 'darkblue')
call s:Col('airlineVisual1',  'uiline', 'purple')
call s:Col('airlineVisual2',  'uiline', 'darkpurple')
call s:Col('airlineReplace1', 'uiline', 'red')
call s:Col('airlineReplace2', 'uiline', 'darkred')

call s:Col('Pmenu',      'base3', 'over')
call s:Col('PmenuSel',   'over',  'blue') | call s:Attr('PmenuSel', 'bold')
call s:Col('PmenuSbar',  '',      'over')
call s:Col('PmenuThumb', '',      'blue')

" hit enter to continue
call s:Col('Question', 'green')

call s:Col('TabLine',     'base1', 'uiline') | call s:Attr('TabLine', 'none')
call s:Col('TabLineFill', 'base1', 'uiline') | call s:Attr('TabLineFill', 'none')
call s:Col('TabLineSel',  'base1'         ) | call s:Attr('TabLineSel', 'bold')

call s:Col('DiffAdd',    '', 'lightgreen')
call s:Col('DiffDelete', 'base4', 'lightred') | call s:Attr('DiffDelete', 'none')
call s:Col('DiffChange', '', 'lightorange')
call s:Col('DiffText',   '', 'difftext')

" }}}

" {{{ Syntax highlighting

hi Ignore   ctermfg=8    guifg=#808080
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
call s:Col('Label', 'base0')
call s:Col('StorageClass', 'red')
call s:Col('Structure', 'red')

" Optimisations {{{

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

" toml
hi link tomlTable ghPurple
hi link tomlKey   ghBlack
" yaml
hi link yamlBlockMappingKey ghGreen

" NERDTree
hi link Directory        ghBlue
hi link NERDTreeDir      ghBlue
hi link NERDTreeCWD      ghRed
hi link NERDTreeExecFile ghPurple
hi link NERDTreeFile     ghDarkBlue

if g:github_colors_extra_functions == 1
  " in C, functions are blue!
  au FileType c syntax match ghBlueFunc /\w\+\s*(/me=e-1,he=e-1
  highlight def link ghBlueFunc Identifier
  au FileType typescript syntax match ghPurpleFunc /\w\+\s*(/me=e-1,he=e-1
  au FileType javascript syntax match ghPurpleFunc /\w\+\s*(/me=e-1,he=e-1
  highlight def link ghPurpleFunc Function
endif

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

hi link Delimiter         ghBlack
hi link SpecialComment    Comment
hi link Character         Number
hi link CursorIM          Cursor
hi link cppSTL            Function
hi link cppSTLType        Type
hi link shDeref           Identifier
hi link shVariable        Function
hi link perlSharpBang     Special
hi link schemeFunc        Statement
hi link typescriptBraces  ghBlack
hi link typescriptBraces  ghBlack
hi link typescriptParens  ghBlack

hi link rubySharpBang     Special
hi link rubyDefine        PreProc
hi link rubyClass         PreProc
hi link rubyConstant      Define
hi link rubyInclude       PreProc

hi link pythonBuiltin     Identifier

" fatih/vim-go
" you should enable more highlights from :h go-syntax
hi link goConstants       Constant
hi link goFunctionCall    Identifier

hi link rustModPath       Define
hi link rustIdentifier    Function

" Plug 'neovimhaskell/haskell-vim'
hi link haskellIdentifier Function
hi link haskellType       Identifier

" }}}

" {{{ Spelling

if has("spell")
  call s:Col('SpellBad', 'red')
    \ | call s:Attr('SpellBad', 'underline')
    " \ | call s:Spell('SpellBad', 'red')
  call s:Col('SpellCap', 'orange')
    \ | call s:Attr('SpellCap', 'underline')
    " \ | call s:Spell('SpellCap', 'orange')
  call s:Col('SpellLocal', 'yellow')
    \ | call s:Attr('SpellLocal', 'underline')
    " \ | call s:Spell('SpellLocal', 'yellow')
  call s:Col('SpellRare', 'base5', 'purple')
    \ | call s:Attr('SpellRare', 'underline')
    " \ | call s:Spell('SpellRare', 'purple')
endif

" }}}

" }}}

