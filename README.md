# Nvim-Dotfiles-Kity

This dotfiles no longer works without `Kitty` or `Iterm2`. If you are using other terminals check [2921e24](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles/tree/2921e241cd2db4ee94b8c4cf75e4c034d7f71d82)

Base on [siduck76/NvChad](https://github.com/siduck76/NvChad) with several developer-friendly improvements. Supporting Javascript, Typescript, Python, Go, Rust, Lua, Java and PHP.
![Main](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/main.png)

*Kitty with Fira code nerd, Cascadia, and nonicons*

## What I have done so far

- Use vivid one dark instead of one dark. (Better contrast colors)
- Support code action. (Base on [nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb))
- Work well with ligature fonts and italic fonts. (Thanks to [Kitty](https://github.com/kovidgoyal/kitty))
- Load previous session. (Thanks to [auto-session](https://github.com/rmagatti/auto-session))
- Able to choose code formatter.
- Support several language's snippet. (I get snippets from [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets))
- Support Emmet. (Thanks to [emmet-ls](https://github.com/aca/emmet-ls))
- Highlight current indent's scope. (Check for more information [indent-blankline#61](https://github.com/lukas-reineke/indent-blankline.nvim/issues/61))
- Bigger icons. (Thanks to [noicons](https://github.com/yamatsum/nonicons))
- Check spell in git's commit, and markdown.
- Show scrollbar. (Useful when u get lost in a large file 😁)
- Show the EOF icon. (Useful when detect trailing spaces)
- Show help's buffer in right.
- Show ```nvim-tree``` in right. (This should be default setting)
- Install all plugins manually.

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

### Javascript

![Javascript](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/javascript.png)

### Go

![Go](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/go.png)

### Rust

![Rust](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/rust.png)

## Configuration

### Theme

You can change colors in ```lua/theme.lua```

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

This config will work well with Kitty (ligature support, multiple fonts)

### Kitty

You can use Operator Mono if you can afford it. Cascadia seems to be a great alternative and it's open source. You need to install [nonicons](https://github.com/yamatsum/nonicons)

```
font_family FiraCode Nerd Font Mono
bold_font Cascadia Code
italic_font Cascadia Mono
bold_italic_font Cascadia Code
symbol_map U+f101-U+f208 nonicons
font_size 16
```

### Plugin list

First step is creating ```~/.local/share/nvim/site/pack/what_ever_nam_but_not_this_one/start``` directory. Then, ```git clone``` list of plugins below.

| Plugin |
| ------ |
| [auto-session](https://github.com/rmagatti/auto-session) |
| [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim) |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim) |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) |
| [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) |
| [nvim-autopair](https://github.com/windwp/nvim-autopairs) |
| [nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) |
| [nvim-comment](https://github.com/terrortylor/nvim-comment) |
| [nvim-compe](https://github.com/hrsh7th/nvim-compe) |
| [nvim-cursorword](https://github.com/xiyaowong/nvim-cursorword) |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) |
| [nvim-scrollview](https://github.com/dstein64/nvim-scrollview) |
| [nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua) |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) |
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow) |
| [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) |
| [popup.nvim](https://github.com/nvim-lua/popup.nvim) |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) |
| [trouble.nvim](https://github.com/folke/trouble.nvim) |

## Mappings

| Key | Description |
| --- | ----------- |
| &lt;Leader&gt;w | Delete current buffer |
| &lt;Leader&gt;a | Code action |
| &lt;Leader&gt;b | Toggle Nvim-Tree |
| &lt;Leader&gt;c | Show git commit search |
| &lt;Leader&gt;g | Show gitmoji search |
| &lt;Leader&gt;f | Show text search |
| &lt;Leader&gt;l | Go to right window |
| &lt;Leader&gt;h | Go to left window |
| &lt;Leader&gt;n | Create new file |
| &lt;neader&gt;m | Change code formatter |
| &lt;Leader&gt;p | Show file search |
| &lt;Leader&gt;r | Show buffer search |
| &lt;Leader&gt;/ | Toggle comment |
| &lt;Leader&gt;q | Turn off highligh search |
| &lt;Leader&gt;s | Save file |
| &lt;M-t&gt; | Toggle Terminal |
| jk | Insert mode to normal mode |

## Treesitter

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Treesitter)

## Lanuage Server

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Language-server)

## Code Formatter

Check [wiki](https://github.com/Nguyen-Hoang-Nam/nvim-dotfiles-kitty/wiki/Code-formatter)

## TODO

- [ ] Show theme in wiki
- [ ] Add more treesitter highlight group
- [ ] Support Flutter
- [ ] Add PHP to wiki
- [ ] Show images of all supporting languages

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
