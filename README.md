# vim-colors-github

A Vim colorscheme based on Github's syntax highlighting as of 2018.

Install with your favourite plugin manager. For vim-plug:

```viml
Plug 'cormacrelf/vim-colors-github'
```

Then set your colorscheme to 'github':

```viml
" ~/.vimrc
colorscheme github

" optional
let g:airline_theme = "github"

" default is to extend a few languages' syntaxes to highlight function calls (eg c)
" use this to disable
let g:github_colors_extra_functions = 0
colorscheme github
```

## Screenshots

### C

![c](example.com)

### Rust

![rust](example.com)

### Diff

![diff](example.com)

## License

Distributed under the same terms as Vim itself. See `:help license`.
