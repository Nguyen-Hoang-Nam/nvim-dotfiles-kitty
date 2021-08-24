# Nvim-Dotfiles-Kitty

NeoVim Configuration that makes me feel comfortable and pleasant. I use this daily for JavaScript, Python, Go, Rust, Lua, PHP and Java.

![Main](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/main.png)

_Kitty with Fira, Cascadia, and Nonicons_

## What I have done so far

- Use primitive colours. (Default is Vivid One Dark)
- Use ligature font, italic font and icon font. (Thanks to [Kitty](https://github.com/kovidgoyal/kitty))
- Bigger icons. (Thanks to [Noicons](https://github.com/yamatsum/nonicons))
- Saving the last session. (Thanks to [auto-session](https://github.com/rmagatti/auto-session))
- Highlight current indent's scope. (Check for more information [indent-blankline#61](https://github.com/lukas-reineke/indent-blankline.nvim/issues/61))
- Support several language's snippet. (I get snippets from [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets))
- Support Emmet. (Thanks to [emmet-ls](https://github.com/aca/emmet-ls))
- Support lint and formatter. (Thanks to [Efm-Langsever](https://github.com/mattn/efm-langserver))
- Show scrollbar. (Useful when u get lost in a large file 😁)
- Show the EOF icon. (Useful when detect trailing spaces)
- Install all plugins manually.

## Startup

```text
=====================================
Top 10 plugins slowing nvim's startup
=====================================
1   2.143   nvim-compe
2   1.766   indent-blankline.nvim
3   1.565   nvim-scrollview
4   0.605   nvim-treesitter
5   0.575   auto-session
6   0.334   nvim-ts-autotag
7   0.238   nvim-treesitter-pairs
8   0.133   dashboard-nvim
9   0.117   LuaSnip
10  0.117   telescope.nvim
=====================================
```

## Screenshot

### Dashboard

![Dashboard](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/dashboard.png)

### Telescope

![Telescope](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/telescope.png)

### Tree

![Tree](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/tree.png)

### Terminal

![Terminal](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/terminal.png)

### Help

![Help](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/help.png)

### JavaScript

![JavaScript](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/javascript.png)

### Go

![Go](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/go.png)

### Rust

![Rust](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/rust.png)

## Configuration

### Theme

All primitive colours are stored in `lua/theme.lua`

```lua
M = {
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
}
```

## Installation

### Requirements

- Kitty
- Neovim 0.5

### Fonts

- [nonicons](https://github.com/yamatsum/nonicons)
- Fira code (Or any ligature font)
- Cascadia (Or any italic font)

### Kitty

```text
font_family FiraCode Nerd Font Mono
bold_font Cascadia Code
italic_font Cascadia Mono
bold_italic_font Cascadia Code
symbol_map U+f101-U+f208 nonicons
font_size 16
cursor #6796E6
```

### Plugin list

Git clone below plugins in `~/.local/share/nvim/site/pack/*/start`.

| Plugin                                                                                          |
| ----------------------------------------------------------------------------------------------- |
| [auto-session](https://github.com/rmagatti/auto-session)                                        |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                                         |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                                                 |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                                      |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)                                     |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)                            |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                     |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)                 |
| [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)                               |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                                                  |
| [nvim-autopair](https://github.com/windwp/nvim-autopairs)                                       |
| [nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)                           |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)                            |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                                 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                      |
| [nvim-scrollview](https://github.com/dstein64/nvim-scrollview)                                  |
| [nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua)                           |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)                                    |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                           |
| [nvim-treesitter-pairs](https://github.com/theHamsta/nvim-treesitter-pairs)                     |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)                                    |
| [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) |
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)                                      |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)                            |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                                        |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)        |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                              |

### Treesitter

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Treesitter)

### Language Server

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Language-server)

### Lint and Formatter

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Code-formatter)

## Mappings

| Key             | Description                 |
| --------------- | --------------------------- |
| &lt;Leader&gt;a | Code action                 |
| &lt;Leader&gt;b | Toggle Nvim-Tree            |
| &lt;Leader&gt;d | Go to definition            |
| &lt;Leader&gt;e | Search emojis               |
| &lt;Leader&gt;f | Show text search            |
| &lt;Leader&gt;g | Search gitmojis             |
| &lt;Leader&gt;h | Go to left window           |
| &lt;Leader&gt;l | Go to right window          |
| &lt;leader&gt;m | Change code formatter       |
| &lt;Leader&gt;o | Search buffers              |
| &lt;Leader&gt;p | Show file search            |
| &lt;Leader&gt;q | Turn off search's highlight |
| &lt;Leader&gt;r | Rename variable             |
| &lt;Leader&gt;s | Save file                   |
| &lt;Leader&gt;w | Delete current buffer       |
| &lt;Leader&gt;/ | Toggle comment              |
| &lt;Leader&gt;; | Jump to pairs               |
| &lt;M-t&gt;     | Toggle Terminal             |
| jk              | Insert mode to normal mode  |

## TODO

- [ ] Show theme in wiki
- [ ] Support Flutter
- [ ] Add PHP to wiki
- [ ] Show images of all supporting languages

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
