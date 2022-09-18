# Nvim Dotfiles Kitty

Neovim + Kitty = ❤️

![Main](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/main.png)
_Kitty with Fira, Cascadia, and Mini-File-Icons_

## Documentation

- [What I have done so far](#what-i-have-done-so-far)
- [Why I choose Kitty Terminal](#why-i-choose-kitty-terminal)
- [Which framework I use this with](#which-framework-i-use-this-with)
- [Supported languages feature](#supported-languages-feature)
- [Startup](#startup)
- [Screenshot](#screenshot)
- [Dashboard](#dashboard)
  - [Telescope](#telescope)
  - [Terminal](#terminal)
  - [Help](#help)
  - [Javascript](#javascript)
  - [Go](#go)
- [Installation](#installation)
  - [Requirements](#requirements)
  - [Fonts](#fonts)
  - [Kitty](#kitty)
- [Add unsupported languages](#add-unsupported-languages)
  - [Syntax highlight](#syntax-highlight)
  - [Language Server Protocol](#language-server-protocol)
  - [Formatter and Linter](#formatter-and-linter)
  - [Debug](#debug-1)
  - [Test](#test-1)
- [TODO](#todo)
- [Contributing](#contributing)
- [License](#license)

## What I have done so far

- Ligature font, Italic font and Icon font.
  (Thanks to [Kitty](https://github.com/kovidgoyal/kitty))
- Saving the last session.
  (Thanks to [Auto-Session](https://github.com/rmagatti/auto-session))
- Debugging
  (Thanks to [Nvim-Dap](https://github.com/mfussenegger/nvim-dap))
- Unit Testing
  (Thanks to [Vim-Test](https://github.com/vim-test/vim-test))
- REST API test.
  (Thanks to [Rest.nvim](https://github.com/NTBBloodbath/rest.nvim))
- Snippet
  (I get snippets from [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets))
- Linting and Formatting
  (Thanks to [Efm-Langsever](https://github.com/mattn/efm-langserver))
- Previewing PNG image ([#4341](https://github.com/kovidgoyal/kitty/issues/4341))
  (Thanks to [Hologram](https://github.com/edluffy/hologram.nvim))
- Executing SQL
  (Thanks to [SQLS.nvim](https://github.com/nanotee/sqls.nvim))
- Support Winbar, cmdheight = 0 (Turn off due to core dump), laststatus = 3
- Support fold. [#4](https://github.com/kevinhwang91/nvim-ufo/issues/4)
  (Thank to [Nvim-Ufo](https://github.com/kevinhwang91/nvim-ufo))
- Managing plugins manually.

## Why I choose Kitty Terminal

- Support combine multiple fonts
- Support display image protocol

## Which framework I use this with

- React
- Svelte
- Tailwind
- Express
- Gin
- FastAPI
- Laravel
- Spring Boot
- Phoenix

## Supported languages feature

| Language   | LSP    | Treesitter | Formatter | Lint | Debug | Test |
| ---------- | ------ | ---------- | --------- | ---- | ----- | ---- |
| Bash       | 👍     | 👍         | 👍        |      |       | 👍   |
| C          | 👍     | 👍         |           |      |       |      |
| CMake      | 👍     | 👍         | 👍        |      |       |      |
| CPP        | 👍     | 👍         | 👍        |      |       |      |
| CSS        | 👍👍👍 | 👍         | 👍        | 👍   |       |      |
| Dart       | 👍     | 👍         | 👍        |      |       | 👍👍 |
| Dockerfile | 👍     | 👍         |           | 👍   |       |      |
| Elixir     | 👍     | 👍         | 👍        |      |       | 👍   |
| Go         | 👍     | 👍         | 👍👍      | 👍   | 👍    | 👍   |
| Haskell    | 👍     | 👍         |           |      |       | 👍   |
| HTML       | 👍👍👍 | 👍         | 👍        |      |       |      |
| HTTP       |        | 👍         |           |      |       |      |
| Java       | 👍     | 👍         | 👍        |      | 👍    | 👍   |
| Javascript | 👍     | 👍👍       | 👍        |      | 👍    |      |
| JSON       | 👍     | 👍         | 👍        |      |       |      |
| Lua        | 👍     | 👍         | 👍        |      |       |      |
| Markdown   |        | 👍         | 👍        | 👍   |       |      |
| PHP        | 👍     | 👍         | 👍        | 👍   |       |      |
| Python     | 👍     | 👍         | 👍        | 👍   |       |      |
| React      | 👍👍   | 👍         | 👍        |      |       |      |
| Rust       | 👍     | 👍         | 👍        |      |       | 👍   |
| Scala      |        | 👍         |           |      |       |      |
| Solidity   | 👍     | 👍         | 👍        |      |       |      |
| Svelte     | 👍👍   | 👍         | 👍        |      |       |      |
| Tex        | 👍     | 👍         | 👍        |      |       |      |
| TOML       |        | 👍         |           |      |       |      |
| Typescript | 👍     | 👍         | 👍        | 👍   |       |      |
| XML        | 👍     | 👍         | 👍        |      |       |      |
| YAML       | 👍     | 👍         | 👍        |      |       |      |
| Zig        | 👍     | 👍         |           |      |       |      |

## Startup

Last updated Jan 2 2021

```text
=====================================
Top 10 plugins slowing nvim's startup
=====================================
1   3.097   vim-test
2   1.636   nvim-scrollview
3   1.290   nvim-treesitter
4   0.467   nvim-cmp
5   0.400   vim-ultest
6   0.398   nvim-ts-autotag
7   0.326   indent-blankline.nvim
8   0.163   cmp_luasnip
9   0.162   LuaSnip
10  0.156   cmp-path
=====================================
```

## Screenshot

### Dashboard

![Dashboard](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/dashboard.png)

### Telescope

![Telescope](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/telescope.png)

### Terminal

![Terminal](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/terminal.png)

### Help

![Help](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/help.png)

### JavaScript

![JavaScript](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/javascript.png)

### Go

![Go](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/go.png)

Find more in [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Screenshot)

## Installation

Read [Wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki) for
full installation.

### Requirements

- Kitty
- Neovim 0.8.0-dev (Last updated Jul 02 2022)

### Fonts

- [mini-file-icons](https://github.com/Nguyen-Hoang-Nam/mini-file-icons)
- Fira code (Or any ligature font)
- Cascadia (Or any italic font)

### Kitty

```text
font_family FiraCode Nerd Font Mono
bold_font Cascadia Code
italic_font Cascadia Mono
bold_italic_font Cascadia Code
symbol_map U+e900-U+e954 mini-file-icons
font_size 16
cursor #6796E6
```

## TODO

- [ ] Show theme in wiki
- [ ] Support Flutter
- [ ] Add test summary to sidebar
- [ ] Change highlight of nvim-dap-ui
- [ ] Change highlight of vim-ultest
- [ ] Handle lsp_extension
- [ ] Support [nvim-covarage](https://github.com/andythigpen/nvim-coverage)
- [x] Support [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
- [x] Support [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [ ] Support [Graphql](https://github.com/graphql/graphiql/tree/main/packages/graphql-language-service-cli)

## Contributing

Pull requests are welcome. For major changes,
please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
