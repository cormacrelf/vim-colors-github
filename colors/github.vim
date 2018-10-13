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
let colors_name = "github"
hi clear
if exists("syntax_on")
    syntax reset
endif

if !exists("g:github_colors_extra_functions")
  let g:github_colors_extra_functions = 1
endif

" Helper functions {{{

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
let s:colors.white          = { 'gui': '#ffffff', 'cterm': 255 }
let s:colors.base0          = { 'gui': '#24292e', 'cterm': 0   } " github text fg
let s:colors.base1          = { 'gui': '#41484f', 'cterm': 61  } " lightened from 0
let s:colors.base2          = { 'gui': '#6a737d', 'cterm': 246 } " comment
let s:colors.base3          = { 'gui': '#fafbfc', 'cterm': 246 } " generic light
let s:colors.base4          = { 'gui': '#babbbc', 'cterm': 246 } " linenr lighter
let s:colors.base5          = { 'gui': '#76787b', 'cterm': 246 } " linenr darker
let s:colors.base6          = { 'gui': '#ebeced', 'cterm': 246 } " linenr darker
let s:colors.base7          = { 'gui': '#dddddd', 'cterm': 246 } " 
let s:colors.red            = { 'gui': '#d73a49', 'cterm': 1   } " github syntax
let s:colors.darkred        = { 'gui': '#b31d28', 'cterm': 1   } " github syntax
let s:colors.orange         = { 'gui': '#e36209', 'cterm': 9   } " github syntax
let s:colors.purple         = { 'gui': '#6f42c1', 'cterm': 5   } " github syntax
let s:colors.darkpurple     = { 'gui': '#352650', 'cterm': 5   } " ^- darkened
let s:colors.blue           = { 'gui': '#005cc5', 'cterm': 4   } " github syntax
let s:colors.darkblue       = { 'gui': '#032f62', 'cterm': 2   } " ^- darkened
let s:colors.yellow         = { 'gui': '#ffffc5', 'cterm': 228 } " github search
let s:colors.green          = { 'gui': '#22863a', 'cterm': 2   } " github syntax (html)
let s:colors.lightgreen     = { 'gui': '#e6ffed', 'cterm': 123 } " github diff
let s:colors.lightred       = { 'gui': '#ffeef0', 'cterm': 123 } " github diff
let s:colors.lightorange_nr = { 'gui': '#fff5b1', 'cterm': 123 } " github selected line number column
let s:colors.lightorange    = { 'gui': '#fffbdd', 'cterm': 123 } " github selected line
let s:colors.difftext       = { 'gui': '#f2e496', 'cterm': 123 } " ^- darkened
let s:colors.lightblue      = { 'gui': '#f1f8ff', 'cterm': 123 } " github diff folds
let s:colors.visualblue     = { 'gui': '#e4effb', 'cterm': 123 } " ^- darkened
let s:colors.medblue        = { 'gui': '#b2ceec', 'cterm': 123 } " ^- darkened

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

call s:Col('Normal', 'base0', 'white')
call s:Col('Cursor', 'base3', 'base0') " only if vim gets to render cursor
call s:Col('Visual', '', 'visualblue')
call s:Col('VisualNOS', '', 'lightblue')
call s:Col('Search', '', 'yellow') | call s:Attr('Search', 'bold')

call s:Col('MatchParen', 'base0', 'medblue')
call s:Col('Conceal', 'blue')
call s:Col('SpecialKey', 'blue') | call s:Attr('SpecialKey', 'italic')
call s:Col('WarningMsg', 'red')
call s:Col('ErrorMsg', 'darkred', 'base3')
call s:Col('Error', 'base3', 'darkred')
call s:Col('Title', 'blue')

call s:Col('VertSplit',    'base6', 'base6')
call s:Col('SignColumn',   'base4', 'base3')
call s:Col('ColorColumn',  '',      'base4')
call s:Col('LineNr',       'base4', 'base3')
call s:Col('CursorLine',   '',      'lightorange')
call s:Col('CursorLineNR', 'base5', 'lightorange_nr')
hi! link CursorColumn CursorLine
" tildes at the bottom
hi! link NonText      LineNr

call s:Col('Folded', 'base5', 'lightblue')
call s:Col('FoldColumn', 'medblue', 'base3')

call s:Col('StatusLine',      'base3', 'base0')
call s:Col('StatusLineNC',    'base5', 'base6')
" statusline determines inactive wildmenu entries too
call s:Col('WildMenu', 'base3', 'blue')

call s:Col('airlineN1',       'base3', 'base0')
call s:Col('airlineN2',       'base3', 'base1')
call s:Col('airlineN3',       'base0', 'base6')
call s:Col('airlineInsert1',  'base3', 'blue')
call s:Col('airlineInsert2',  'base3', 'darkblue')
call s:Col('airlineVisual1',  'base3', 'purple')
call s:Col('airlineVisual2',  'base3', 'darkpurple')
call s:Col('airlineReplace1', 'base3', 'red')
call s:Col('airlineReplace2', 'base3', 'darkred')

call s:Col('Pmenu',      'base5', 'base3')
call s:Col('PmenuSel',   'base3', 'blue') | call s:Attr('PmenuSel', 'bold')
call s:Col('PmenuSbar',  '',      'base6')
call s:Col('PmenuThumb', '',      'blue')

" hit enter to continue
call s:Col('Question', 'green')

call s:Col('TabLine',     'base1', 'base7') | call s:Attr('TabLine', 'none')
call s:Col('TabLineFill', 'base1', 'base7') | call s:Attr('TabLineFill', 'none')
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
"
" hi link vimGroup          ghBlack
hi link vimHiTerm         ghBlack
hi link vimHiGroup        ghOrange
hi link vimUserFunc       ghPurple


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
  call s:Col('SpellRare', 'base7', 'purple')
    \ | call s:Attr('SpellRare', 'underline')
    " \ | call s:Spell('SpellRare', 'purple')
endif

" }}}

" }}}

