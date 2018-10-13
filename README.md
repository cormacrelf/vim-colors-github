# vim-colors-github

A Vim colorscheme based on Github's syntax highlighting as of 2018.

I wasn't happy with [endel/vim-github-colorscheme](https://github.com/endel/vim-github-colorscheme), as it was out of date.

## Install

Install with your favourite plugin manager. For vim-plug:

```viml
Plug 'cormacrelf/vim-colors-github'
```

Then set your colorscheme to 'github':

```viml
" in your .vimrc or init.vim
colorscheme github

" if you use airline
let g:airline_theme = "github"
```

## Options

Place **before** the `colorscheme github`:

```viml
" use a slightly darker background, like GitHub inline code blocks
let g:github_colors_soft = 1

" default is to extend a few languages' syntaxes to highlight function calls
" (eg c). use this to disable that.
let g:github_colors_extra_functions = 0
```

## Screenshots

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
