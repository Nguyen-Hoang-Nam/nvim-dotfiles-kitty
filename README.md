# Nvim-Dotfiles

Base on [siduck76/NvChad](https://github.com/siduck76/NvChad), I add and change several things to make me feel like my old home (visual studio code).

![Main](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/main.png)

*I use Kitty with Fira code nerd font for main font and Cascadia for italic font*

## What I have done so far

- Use vivid one dark instead of one dark. (Better contrast colors)
- Move all raw colors to primitive colors. (Get this idea from [siduck76/NvChad](https://github.com/siduck76/NvChad))
- Cache for galaxyline. (It renders a lot so cache it if you can)
- Work well with ligature fonts and italic fonts.
- Use both EFM and other LSPs to format files. (Check for more information [choose formatter](https://www.reddit.com/r/neovim/comments/nlhnio/noevim_is_asking_to_select_a_languageserver_when/))
- Support several language's snippet. (I get snippets from [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets))
- Support Emmet. (It's still a mess)
- Highlight current indent's scope. (Check for more information [indent-blankline#61](https://github.com/lukas-reineke/indent-blankline.nvim/issues/61))
- Check spell in git's commit and markdown.
- Highlight matching words.
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
M.colors = {
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

You can use operator mono if you can afford it. Cascadia seems to be a great alternative and it's open source.

```
font_family FiraCode Nerd Font Mono
bold_font Cascadia Code
italic_font Cascadia Mono
bold_italic_font Cascadia Code
font_size 15
```

### Plugin list

First step is creating ```~/.local/share/nvim/site/pack/what_ever_nam_but_not_this_one/start``` directory. Then, ```git clone``` list of plugins below.

| Plugin |
| ------ |
| [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim) |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim) |
| [formatter.nvim](https://github.com/mhartington/formatter.nvim) |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) |
| [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) |
| [lsp-color.nvim](https://github.com/folke/lsp-colors.nvim) |
| [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) |
| [lspkind-nvim](https://github.com/onsails/lspkind-nvim) |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) |
| [nvim-autopair](https://github.com/windwp/nvim-autopairs) |
| [nvim-base16](https://github.com/Nguyen-Hoang-Nam/nvim-base16) |
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

### Treesitter

I affair it still work really bad now. Next step, command ```:TSInstall``` which language you use in below.

- python
- lua
- go
- jsdoc
- php
- latex
- css
- regex
- svelte
- c
- bash
- yaml
- html
- tsx
- dockerfile
- rust
- toml
- javascript

### Language server

I sorry but we are not in the hardest part yet. Still with me, next one is LSP, the trading point in every code editors now.

#### Pyright

Make sure you have NodeJS

```
npm install -g pyright
```

#### Sumneko_lua (This fun)

Check [this](https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)) to install and change ```symneko_root_path``` in ```lua/langs/lua.lua``` to your directory.

#### Gopls

Make sure you have Go

```
GO111MODULE=on go get golang.org/x/tools/gopls@latest
```

#### Texlab

Make sure you have Rust

```
cargo install --git https://github.com/latex-lsp/texlab.git --locked
```

#### Cssls

Make sure you have Nodejs

```
npm i -g vscode-langservers-extracted
```

#### Svelte

Make sure you have NodeJS

```
npm install -g svelte-language-server
```

#### Yamlls

Make sure you have NodeJS

```
npm install -g yaml-language-server
```

#### Html

Make sure you have NodeJS

```
npm i -g vscode-langservers-extracted
```

#### Tsserver

Make sure you have NodeJS

```
npm install -g typescript typescript-language-server
```

#### Dockerls

Make sure you have NodeJS

```
npm install -g dockerfile-language-server-nodejs
```

#### Rust_analyzer

```
$ curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
$ chmod +x ~/.local/bin/rust-analyzer
```

#### EFM

Make sure you have Go

```
go get github.com/mattn/efm-langserver
```

#### Emmet-ls

Make sure you have NodeJS

```
npm install -g emmet-ls
```

### Format

Hope you are not tired now. Next one is code formatter, some LSPs already support formatter but slow and tidy.

#### Black

Make sure you have Python

```
pip install black
```

#### Stylua

Make sure you have Rust

```
cargo install stylua
```

#### Goimport

Make sure you have Go

```
go get golang.org/x/tools/cmd/goimports
```

#### Gofumpt

Make sure you have Go

```
GO111MODULE=on go get mvdan.cc/gofumpt
```

#### Latexindent.pl

Make sure you have Perl, cmake

```
$ git clone https://github.com/cmhughes/latexindent.pl
$ cd latexindent.pl
$ mkdir build && cd build
$ cmake ../path-helper-files
$ sudo make install
```

Then install wherever perl's package missing 😅

#### Prettier

Make sure you have NodeJS

```
npm install -g prettier
```

#### Rustfmt

Make sure you have Rust

```
$ git clone https://github.com/rust-lang/rustfmt
$ cd rustfmt
$ cargo install --path .
```

## Mappings

| Key | Description |
| --- | ----------- |
| &lt;Leader&gt;d | Delete current buffer |
| &lt;Leader&gt;b | Toggle Nvim-Tree |
| &lt;Leader&gt;c | Show git commit search |
| &lt;Leader&gt;e | Show gitmoji search |
| &lt;Leader&gt;f | Show text search |
| &lt;Leader&gt;g | Preview Markdown file |
| &lt;Leader&gt;l | Go to right window |
| &lt;Leader&gt;h | Go to left window |
| &lt;Leader&gt;n | Create new file |
| &lt;Leader&gt;p | Show file search |
| &lt;Leader&gt;r | Show buffer search |
| &lt;Leader&gt;/ | Toggle comment |
| &lt;Leader&gt;s | Turn off highligh search |
| &lt;M-t&gt; | Toggle Terminal |
| jk | Insert mode to normal mode |

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
