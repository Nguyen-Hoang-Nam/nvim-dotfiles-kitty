#!/bin/bash


installation_dir=${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/pack

deps=( "aerial:stevearc/aerial.nvim"
       "nvim-autopairs:windwp/nvim-autopairs"
       "dashboard:glepnir/dashboard-nvim"
       "auto-session:rmagatti/auto-session"
       "nvim-biscuits:code-biscuits/nvim-biscuits"
       "indent_blankline:lukas-reineke/indent-blankline.nvim"
       "bufferline:akinsho/bufferline.nvim"
       "cmp:hrsh7th/nvim-cmp"
       "luasnip:L3MON4D3/LuaSnip"
       "tabout:abecodes/tabout.nvim"
       "dap:mfussenegger/nvim-dap"
       "dapui:rcarriga/nvim-dap-ui"
       "nvim-dap-virtual-text:theHamsta/nvim-dap-virtual-text"
       "diffview:sindrets/diffview.nvim"
       "fidget:j-hui/fidget.nvim"
       "gitsigns:lewis6991/gitsigns.nvim"
       "goto-preview:rmagatti/goto-preview"
       "hologram:edluffy/hologram.nvim"
       "rest-nvim:NTBBloodbath/rest.nvim"
       "windline:windwp/windline.nvim"
       "twilight:folke/twilight.nvim"
       "nvim-treesitter:nvim-treesitter/nvim-treesitter"
       "toggleterm:akinsho/toggleterm.nvim"
       "todo-comments:folke/todo-comments.nvim"
       "telescope:nvim-telescope/telescope.nvim"
       "ui-select:nvim-telescope/telescope-ui-select.nvim"
       "lsp_signature:ray-x/lsp_signature.nvim"
       "scrollbar:petertriho/nvim-scrollbar"
       "yanil:Xuyuanp/yanil"
       "jdtls:mfussenegger/nvim-jdtls"
       "colorizer:norcalli/nvim-colorizer.lua"
       "vim-test:vim-test/vim-test"
       "vim-ultest:rcarriga/vim-ultest"
       "git_utils:Nguyen-Hoang-Nam/git-utils.nvim" )

for dep in ${deps[@]}; do
    name="${dep%%:*}"
    path="${dep##*:}"

    if [ ! -d $installation_dir/$name ]
    then
        echo "📦 Installing $name from $path..."
        git clone --depth=1 https://github.com/$path.git \
            $installation_dir/$name/start/$name.nvim \
            &> /dev/null
        echo "✅ Successfully installed $name"

        # Install pynvim if is vim-ultest
        if [ $name = "vim-ultest" ]; then
            echo "🔨 Installing pynvim..."
            pip3 install --user pynvim &> /dev/null

            echo "✅ pynvim has been installed successfully"
        fi

        # Do extra build steps if is git_utils
        if [ $name = "git_utils" ]; then
            # Check if rust and cargo is installed
            if [ ! command -v cargo &> /dev/null ]; then
                echo "⛔️ cargo is not installed, skipping to build $name"
                continue
            fi

            # Add extra config flags if is MacOS
            # @see https://blog.kdheepak.com/loading-a-rust-library-as-a-lua-module-in-neovim.html
            if [ $OSTYPE = "darwin"* ]; then
                # Add flags to `.cargo/config`
                echo '[target.x86_64-apple-darwin]
                rustflags = ["-C", "link-arg=-undefined", "-C", "link-arg=dynamic_lookup"]

                [target.aarch64-apple-darwin]
                rustflags = ["-C", "link-arg=-undefined", "-C", "link-arg=dynamic_lookup"]' >> $HOME/.cargo/config
            fi

            # Build the library and remove artifacts
            echo "🔨 Building $name..."
            cd $installation_dir/$name/start/$name.nvim
            mkdir -p lua
            cargo build --release &> /dev/null
            mv target/release/libembed.dylib lua/git_utils.so
            rm -r target && rm Cargo.lock
            cd -
            echo "✅ $name has been successfully built"

        fi
    else
        echo "⚠️  $name has already been installed"
    fi
done

