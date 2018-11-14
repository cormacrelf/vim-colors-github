# vim-colors-github

A Vim colorscheme based on Github's syntax highlighting as of 2018.

I wasn't happy with [endel/vim-github-colorscheme](https://github.com/endel/vim-github-colorscheme), as it was out of date.

It degrades gracefully in non-gui mode (ie ctermbg/ctermfg/256colors).

It supports the following plugins:
[airline](https://github.com/vim-airline/vim-airline),
[lightline](https://github.com/vim-airline/lightline),
[fzf](https://github.com/junegunn/fzf),
[GitGutter](https://github.com/airblade/vim-gitgutter),
[NERDTree](https://github.com/scrooloose/nerdtree),
[Startify](https://github.com/mhinz/vim-startify),
[sneak](https://github.com/justinmk/vim-sneak),
and `:terminal`.

Extra tuning has been done for the following languages:
VimL, Markdown, Pandoc Markdown 
([vim-pandoc-syntax](https://github.com/vim-pandoc/vim-pandoc-syntax))
Diff, C, Rust,
Go ([fatih/vim-go](https://github.com/fatih/vim-go)),
Haskell 
([neovimhaskell/haskell-vim](https://github.com/neovimhaskell/haskell-vim)),
Ruby, Python, HTML, XML, TOML, YAML, Clojure, Typescript,
([leafgarland/vim-typescript](https://github.com/leafgarland/vim-typescript)),
JSX/TSX 
([MaxMEllon/vim-jsx-pretty](https://github.com/MaxMEllon/vim-jsx-pretty)),. 


## Install

Install with your favourite plugin manager. For vim-plug:

```viml
Plug 'cormacrelf/vim-colors-github'
```

Then set your colorscheme to 'github':

```viml
" in your .vimrc or init.vim
colorscheme github

" if you use airline / lightline
let g:airline_theme = "github"
let g:lightline = { 'colorscheme': 'github' }
```

## Options

Place **before** the `colorscheme github`:

```viml
" use a slightly darker background, like GitHub inline code blocks
let g:github_colors_soft = 1

" more blocky diff markers in signcolumn (e.g. GitGutter)
let g:github_colors_block_diffmark = 0

:help github_colors.txt
```


### Rust

![rust](https://raw.githubusercontent.com/cormacrelf/vim-colors-github/master/shots/rust.png)

### Soft mode (see above)

![soft](https://raw.githubusercontent.com/cormacrelf/vim-colors-github/master/shots/soft.png)

### C

![c](https://raw.githubusercontent.com/cormacrelf/vim-colors-github/master/shots/c.png)

### Diff

![diff](https://raw.githubusercontent.com/cormacrelf/vim-colors-github/master/shots/diff.png)

## License

Distributed under the same terms as Vim itself. See `:help license`.
