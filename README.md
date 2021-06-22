# Nvim-Dotfiles

Base on [siduck76/NvChad](https://github.com/siduck76/NvChad), with few addition features for backend developer. That it, while this config is working, I really miss some vsc features such as italic, terminal, status line, etc.

![Main](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/main.png)

## What's new and updated

- Decrease some unuseful options such as Find Word, Bookmarks, Session in dashboard's config
- Change background color and dark background color base on VSCode onedark plugin
- Minimalize status line to look like VSCode
- Add syntax italic
- Add floating terminal for small tasks
- Add several configs for lua, rust, go, etc
- Add function signature
- Remove unuseful icons in bufferline
- Change mappings
- Rewrite some functions such as highlight, map, etc
- Add scrollbar
- Show EOL icon
- Show help buffer in right
- Show ```nvim-tree``` in right
- Install all plugin manually

## Screenshot

### Dashboard

![Dashboard](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/dashboard.png)

### Telescope

![Telescope](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/telescope.png)

### Tree

![Tree](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/tree.png)

### Terminal

![Terminal](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/terminal.png)


### Lua

![Lua](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/lua.png)

### Javascript

![Javascript](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/javascript.png)

### Go

![Go](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/go.png)

### Rust

![Rust](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/rust.png)

### PHP

![PHP](https://raw.githubusercontent.com/Nguyen-Hoang-Nam/readme-image/main/nvim-dotfiles/php.png)

## Installation

### Plugin list

| Plugin |
| ------ |
| [bufdelete.nvim](https://github.com/famiu/bufdelete.nvim) |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim) |
| [formatter.nvim](https://github.com/mhartington/formatter.nvim) |
| [galaxyline.nvim](https://github.com/glepnir/galaxyline.nvim) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) |
| [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) |
| [lspkind-nvim](https://github.com/onsails/lspkind-nvim) |
| [nvim-autopair](https://github.com/windwp/nvim-autopairs) |
| [nvim-base16](https://github.com/Nguyen-Hoang-Nam/nvim-base16) |
| [nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) |
| [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) |
| [nvim-comment](https://github.com/terrortylor/nvim-comment) |
| [nvim-compe](https://github.com/hrsh7th/nvim-compe) |
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
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) |
| [vim-move](https://github.com/matze/vim-move) |

### Treesitter

- Python
- Yaml
- Lua
- Go
- PHP
- Rust
- Javascript
- tsx

### Language server

- HTML
- Svelte
- Yamlls
- Cssls
- Sumneko_lua
- Dockerls
- Rust_analyzer
- Pyright
- Gopls
- Tsserver

### Format

- Prettier
- Black
- Rustfmt
- LuaFormatter
- Goimports
- Gofumpt

## Mappings

| Key | Description |
| --- | ----------- |
| <Leader>d | Delete current buffer |
| <Leader>b | Toggle Nvim-Tree |
| <Leader>c | Show git commit search |
| <Leader>e | Show gitmoji search |
| <Leader>f | Show text search |
| <Leader>g | Preview Markdown file |
| <Leader>l | Go to right window |
| <Leader>h | Go to left window |
| <Leader>n | Create new file |
| <Leader>p | Show file search |
| <Leader>r | Show buffer search |
| <Leader>/ | Toggle comment |
| <Leader>s | Turn off highligh search |
| <M-t> | Toggle Terminal |
| jk | Insert mode to normal mode |

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
