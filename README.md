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
- [Configuration](#configuration)
- [Installation](#installation)
  - [Requirements](#requirements)
  - [Fonts](#fonts)
  - [Kitty](#kitty)
  - [Plugin list](#plugin-list)
  - [Treesitter](#treesitter)
  - [Language Server](#language-server)
  - [Formatter](#formatter)
  - [Linter](#linter)
  - [Debug](#debug)
  - [Test](#test)
- [Mappings](#mappings)
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
- Support Winbar [#19458](https://github.com/neovim/neovim/issues/19458),
  cmdheight = 0, laststatus = 3
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

## Configuration

All settings are store in `lua/settings.lua`

```lua
return {
    efm = {
        filetypes = {
            'sh',
            'css',
            'cpp',
            'dart',
            'dockerfile',
            'elixir',
            'go',
            'haskell',
            'html',
            'java',
            'javascript',
            'javascriptreact',
            'json',
            'lua',
            'markdown',
            'php',
            'python',
            'rust',
            'solidity',
            'svelte',
            'tex',
            'typescript',
            'typescriptreact',
            'xml',
            'yaml',
        },
    },

    lspconfigs = {
        filetypes = {
            'sh',
            'cmake',
            'css',
            'cpp',
            'dart',
            'dockerfile',
            'elixir',
            'go',
            'haskell',
            'html',
            'javascript',
            'json',
            'lua',
            'php',
            'python',
            'rust',
            'solidity',
            'svelte',
            'tex',
            'xml',
            -- 'yaml',
            'zig',
        },

        features = {
            'efm',
            'emmet',
            'tailwindcss',
        },
    },

    autoformat = {
        filetypes = {
            'sh',
            'cmake',
            'css',
            'cpp',
            'dart',
            'dockerfile',
            'elixir',
            'go',
            'haskell',
            'html',
            'java',
            'javascript',
            'javascriptreact',
            'json',
            'lua',
            'markdown',
            'php',
            'python',
            'rust',
            'solidity',
            'svelte',
            'tex',
            'typescript',
            'typescriptreact',
            'xml',
            'yaml',
        },
    },

    codeaction = {
        filetypes = {
            'css',
            'cpp',
            'dart',
            'dockerfile',
            'go',
            'html',
            -- 'java',
            'javascript',
            'javascriptreact',
            'json',
            -- 'lua',
            'markdown',
            'php',
            'python',
            'rust',
            'svelte',
            'tex',
            'typescript',
            'typescriptreact',
            'xml',
            'yaml',
        },
    },

    colors = {
        red = '#F9867B',
        orange = '#CD9731',
        yellow = '#FDCE68',
        green = '#A3EEA0',
        cyan = '#6796E6',
        blue = '#7BE2F9',
        purple = '#E19EF5',
        tomato = '#F44747',
        white = '#FFFFFF',

        background = '#212835',
        dark_background = '#1B212C',

        border = '#3E4451',
        comment = '#5C6370',
        lineNumber = '#495162',
        scrollbar = '#4E5666',
        cursorLine = '#2C313A',
        indent = '#383C44',
    },

    signs = {
        DiagnosticSignError = ' ',
        DiagnosticSignWarning = ' ',
        DiagnosticSignHint = ' ',
        DiagnosticSignInfo = ' ',
        CodeActionSign = ' ',
    },

    kinds = {
        Class = ' (class)',
        Color = ' (color)',
        Constant = ' (constant)',
        Constructor = ' (constructor)',
        Enum = ' (enum)',
        EnumMember = ' (enum member)',
        Event = ' (event)',
        Field = ' (field)',
        File = ' (file)',
        Folder = ' (folder)',
        Function = ' (function)',
        Interface = ' (interface)',
        Keyword = ' (keyword)',
        Method = ' (method)',
        Module = '{} (module)',
        Operator = ' (operator)',
        Property = ' (property)',
        Reference = ' (reference)',
        Snippet = ' (snippet)',
        Struct = ' (enum)',
        Text = ' (text)',
        TypeParameter = ' (type parameter)',
        Unit = ' (unit)',
        Value = ' (value)',
        Variable = ' (variable)',
    },

    statusline = {
        git_branch_enabled = true,
        diagnostic_enabled = true,
        git_diff_enabled = true,
        test_enabled = true,
        line_column_enabled = true,
        tab_enabled = true,
        line_break_enabled = true,
        file_format_enabled = true,
        efm_enabled = true,
        emoji_enabled = true,
        emoji_icon = '',
    },
}
```

## Installation

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

### Plugin list

I highly suggest managing plugins manually. This is a tedious job, but you has
more power to manage your plugins.

Please store below plugins in `~/.local/share/nvim/site/pack/*/start/`.

| Plugin                                                                                          | Last updated |
| ----------------------------------------------------------------------------------------------- | ------------ |
| [aerial](https://github.com/stevearc/aerial.nvim)                                               | Jul 25 2022  |
| [auto-session](https://github.com/rmagatti/auto-session)                                        | Jul 14 2022  |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                                   | Jul 24 2022  |
| [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)                                           | May 02 2022  |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                                         | May 16 2022  |
| [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)           | Jul 20 2022  |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                                                 | Jul 26 2022  |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                                      | May 02 2022  |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim)                                      | Jul 20 2022  |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim)                                             | Jul 25 2022  |
| [find-cmdline.nvim](https://github.com/VonHeikemen/fine-cmdline.nvim)                           | Jul 01 2022  |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)                            | Jul 29 2022  |
| [git-conflict](https://github.com/akinsho/git-conflict.nvim)                                    | Jul 03 2022  |
| [git-utils.nvim](https://github.com/Nguyen-Hoang-Nam/git-utils.nvim)                            |              |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                     | Jul 25 2022  |
| [goto-preview](https://github.com/rmagatti/goto-preview)                                        | Jul 19 2022  |
| [hologram.nvim](https://github.com/Nguyen-Hoang-Nam/hologram.nvim)                              | Jul 03 2022  |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)                 | Jul 27 2022  |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                                  | Jul 29 2022  |
| [nui](https://github.com/MunifTanjim/nui.nvim)                                                  | Jul 29 2022  |
| [nvim-autopair](https://github.com/windwp/nvim-autopairs)                                       | Jul 05 2022  |
| [nvim-biscuits](https://github.com/code-biscuits/nvim-biscuits)                                 | Jun 26 2022  |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                                 | Jul 25 2022  |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)                            | Apr 20 2020  |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap)                                            | Jul 28 2022  |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)                                          | Jul 23 2022  |
| [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)                     | Jul 24 2021  |
| [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)                                        | Jul 28 2022  |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                      | Jul 22 2022  |
| [nvim-mini-file-icons](https://github.com/Nguyen-Hoang-Nam/nvim-mini-file-icons)                | Jul 09 2022  |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic)                                            | Jul 17 2022  |
| [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)                                  | Jul 11 2022  |
| [nvim-scrollview](https://github.com/dstein64/nvim-scrollview)                                  | Jun 07 2022  |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                           | Jul 29 2022  |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)                                    | Jul 22 2022  |
| [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) | Apr 07 2022  |
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)                                      | Jul 15 2022  |
| [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)                                            | Jul 30 2022  |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                                        | Jul 10 2022  |
| [sqls.nvim](https://github.com/nanotee/sqls.nvim)                                               | Jul 08 2022  |
| [rest.nvim](https://github.com/NTBBloodbath/rest.nvim)                                          | May 13 2022  |
| [tabout.nvim](https://github.com/abecodes/tabout.nvim)                                          | May 07 2022  |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)        | Jun 09 2022  |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                              | Jul 23 2022  |
| [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)          | Apr 30 2022  |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)                               | Jan 19 2022  |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)                                   | Jul 28 2022  |
| [vim-test](https://github.com/vim-test/vim-test)                                                | Jul 21 2022  |
| [vim-ultest](https://github.com/rcarriga/vim-ultest)                                            | Jun 18 2022  |
| [yanil](https://github.com/Nguyen-Hoang-Nam/yanil/tree/customize-ui)                            |              |

### Treesitter

| Language   | Treesitter |
| ---------- | ---------- |
| Bash       | 👍         |
| C          | 👍         |
| CMake      | 👍         |
| CPP        | 👍         |
| CSS        | 👍         |
| Dart       | 👍         |
| Dockerfile | 👍         |
| Elixir     | 👍         |
| Go         | 👍         |
| Haskell    | 👍         |
| HTML       | 👍         |
| HTTP       | 👍         |
| Java       | 👍         |
| Javascript | 👍👍       |
| JSON       | 👍         |
| Lua        | 👍         |
| Markdown   | 👍         |
| PHP        | 👍         |
| Python     | 👍         |
| React      | 👍         |
| Rust       | 👍         |
| Scala      | 👍         |
| Solidity   | 👍         |
| Svelte     | 👍         |
| Tex        | 👍         |
| TOML       | 👍         |
| Typescript | 👍         |
| XML        | 👍         |
| YAML       | 👍         |
| Zig        | 👍         |

### Language Server

| Language   | LSP                                                                                                                                                                                                                        |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Bash       | [bash-language-server](https://github.com/bash-lsp/bash-language-server)                                                                                                                                                   |
| C          | [clangd](https://clangd.llvm.org/installation.html)                                                                                                                                                                        |
| CMake      | [cmake-language-server](https://github.com/regen100/cmake-language-server)                                                                                                                                                 |
| CPP        | [clangd](https://clangd.llvm.org/installation.html)                                                                                                                                                                        |
| CSS        | [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted), [emmet-ls](https://github.com/aca/emmet-ls), [tailwindcss-intellisense](https://github.com/tailwindlabs/tailwindcss-intellisense) |
| Dart       | [dart-lang/sdk](https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server/tool/lsp_spec)                                                                                                                            |
| Dockerfile | [dockerfile-language-server-nodejs](https://github.com/rcjsuen/dockerfile-language-server-nodejs)                                                                                                                          |
| Elixir     | [elixir-ls](https://github.com/elixir-lsp/elixir-ls)                                                                                                                                                                       |
| Go         | [gopls](https://github.com/golang/tools/tree/master/gopls)                                                                                                                                                                 |
| Haskell    | [haskell-language-server](https://github.com/haskell/haskell-language-server)                                                                                                                                              |
| HTML       | [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted), [emmet-ls](https://github.com/aca/emmet-ls), [tailwindcss-intellisense](https://github.com/tailwindlabs/tailwindcss-intellisense) |
| HTTP       |                                                                                                                                                                                                                            |
| Java       | [jdtls](https://projects.eclipse.org/projects/eclipse.jdt.ls)                                                                                                                                                              |
| Javascript | [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)                                                                                                                     |
| JSON       | [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted)                                                                                                                                    |
| Lua        | [lua-language-server](https://github.com/sumneko/lua-language-server)                                                                                                                                                      |
| Markdown   |                                                                                                                                                                                                                            |
| PHP        | [phpactor](https://github.com/phpactor/phpactor)                                                                                                                                                                           |
| Python     | [pyright](https://github.com/microsoft/pyright)                                                                                                                                                                            |
| React      | [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server), [tailwindcss-intellisense](https://github.com/tailwindlabs/tailwindcss-intellisense)                               |
| Rust       | [rust-analyzer](https://github.com/rust-lang/rust-analyzer)                                                                                                                                                                |
| Scala      |                                                                                                                                                                                                                            |
| Solidity   | [vscode-solidity](https://github.com/juanfranblanco/vscode-solidity)                                                                                                                                                       |
| Svelte     | [sveltejs/language-tools](https://github.com/sveltejs/language-tools/tree/master/packages/language-server), [tailwindcss-intellisense](https://github.com/tailwindlabs/tailwindcss-intellisense)                           |
| Tex        | [texlab](https://github.com/latex-lsp/texlab)                                                                                                                                                                              |
| TOML       |                                                                                                                                                                                                                            |
| Typescript | [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)                                                                                                                     |
| XML        | [lemminx](https://github.com/eclipse/lemminx)                                                                                                                                                                              |
| YAML       | [yaml-language-server](https://github.com/redhat-developer/yaml-language-server)                                                                                                                                           |
| Zig        | [zls](https://github.com/zigtools/zls)                                                                                                                                                                                     |

### Formatter

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Code-formatter)

### Linter

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Linter)

### Debug

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Debug)

### Test

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Test)

## Mappings

| Key             | Description                 |
| --------------- | --------------------------- |
| &lt;Leader&gt;0 | Add break point             |
| &lt;Leader&gt;1 | Toggle debug                |
| &lt;Leader&gt;2 | Step over                   |
| &lt;Leader&gt;3 | Step into                   |
| &lt;Leader&gt;4 | Step out                    |
| &lt;Leader&gt;9 | Scope information           |
| &lt;Leader&gt;a | Code action                 |
| &lt;Leader&gt;b | Toggle biscuit              |
| &lt;Leader&gt;c | Range format                |
| &lt;Leader&gt;d | Go to definition            |
| &lt;Leader&gt;e | Search Gitmojis             |
| &lt;Leader&gt;f | Search text                 |
| &lt;Leader&gt;g | Toggle git hover            |
| &lt;Leader&gt;m | Format code                 |
| &lt;Leader&gt;n | Show floating Cmdline       |
| &lt;Leader&gt;o | Search buffers              |
| &lt;Leader&gt;p | Search file                 |
| &lt;Leader&gt;q | Turn off search's highlight |
| &lt;Leader&gt;r | Rename variable             |
| &lt;Leader&gt;s | Save file                   |
| &lt;Leader&gt;t | Toggle test                 |
| &lt;Leader&gt;u | Search text in project      |
| &lt;Leader&gt;w | Delete current buffer       |
| &lt;Leader&gt;z | Preview definition          |
| &lt;Leader&gt;/ | Toggle comment              |
| &lt;M-b&gt;     | Toggle Explorer             |
| &lt;M-d&gt;     | Toggle Debug sidebar        |
| &lt;M-t&gt;     | Toggle Terminal             |
| &lt;M-r&gt;     | Toggle Rest Tab             |
| &lt;M-s&gt;     | Toggle SQL Tab              |
| &lt;M-x&gt;     | Toggle Symbol sidebar       |
| jk              | Insert to normal            |
| gh              | Go to left window           |
| gj              | Go to above window          |
| gk              | Go to below window          |
| gl              | Go to right window          |
| cj              | Go to above change          |
| ck              | Go to below change          |
| cb              | Go to both change           |
| c0              | Go to none change           |
| \]d             | Go to next diagnostic       |
| \[d             | Go to previous diagnostic   |
| \]b             | Go to next Buffer           |
| \[b             | Go to previous Buffer       |
| \]g             | Go to next Git conflict     |
| \[g             | Go to previous Git conflict |
| \]q             | Go to next Tab              |
| \[q             | Go to previous Tab          |
| \]t             | Go to next failed test      |
| \[t             | Go to previous failed test  |
| \]x             | Go to next function         |
| \[x             | Go to previous function     |

## Add unsupported languages

You can add unsupported languages by follow these steps.

### Syntax highlight

If [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter#supported-languages) supports your language,
then you can run this command to install syntax highlight.

```
:TSInstall <language>
```

### Language Server Protocol

You can find server for your language [Here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

After you've installed the LSP, you need to create a file in `after/ftplugin`,
`lua/languages`.

```lua
-- lua/langauges/your-language.lua
local lsp = require('languages.lsp')
local M = {}

M.lsp_server = '<name of LSP>'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    -- Any extra configuration should put there
}

return M
```

```lua
-- after/ftplugin/your-language.lua
vim.opt.indentexpr = 'nvim_treesitter#indent()' -- Optional, If you use indent of treesitter

require('cmp').setup.buffer({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- Optional, If you use snippet
        { name = 'path' }, -- Optional, If your language need path
        { name = 'nvim_lsp_signature_help' }, -- Optional, If your language has signature
    },
})
```

You also need to add your language to `/lua/settings.lua`

```lua
-- /lua/settings.lua
return {
    lspconfigs = {
        filetypes = {
            ...,
            '<your lanugage>',
            ...,
        },
    },
}
```

### Formatter and Linter

You need to install these tools first then go to `/lua/languages/<your language>.lua`

```lua
-- /lua/languages/<your language>.lua
M.efm = {
    {
        formatCommand = 'formatter1',
        formatStdin = true,
    },
    {
        formatCommand = 'formatter2',
        formatStdin = true,
    },
    {
        lintCommand = 'linter1',
        lintIgnoreExitCode = true,
        lintStdin = true,
        lintFormats = {
            'Your linter format',
        },
    },
}

M.all_format = { efm = 'Formatter1   Formatter2   Linter1' }

M.default_format = 'efm'
```

### Debug

You can check debug server [here](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)

### Test

You can check test tools [here](https://github.com/vim-test/vim-test)

## TODO

- [ ] Show theme in wiki
- [ ] Support Flutter
- [ ] Use nix to manage package.
- [ ] Add test summary to sidebar
- [ ] Change highlight of nvim-dap-ui
- [ ] Change highlight of vim-ultest
- [ ] Handle lsp_extension
- [ ] Support [nvim-covarage](https://github.com/andythigpen/nvim-coverage)
- [x] Support [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
- [ ] Support [template.nvim](https://github.com/glepnir/template.nvim)
- [x] Support [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [ ] Support [Graphql](https://github.com/graphql/graphiql/tree/main/packages/graphql-language-service-cli)
- [ ] Support [vscode-codicons](https://github.com/microsoft/vscode-codicons)

## Contributing

Pull requests are welcome. For major changes,
please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
