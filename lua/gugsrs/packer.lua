vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'smartpde/telescope-recent-files' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- Colorschemes
    use { 'rose-pine/neovim', as = 'rose-pine', }
    use { "catppuccin/nvim", as = "catppuccin", }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use { 'nvim-treesitter/nvim-treesitter-context' }
    use { 'theprimeagen/harpoon', branch = 'harpoon2' }
    use { 'theprimeagen/git-worktree.nvim' }
    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }
    use { 'github/copilot.vim' }
    use { "sindrets/diffview.nvim" }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            {
                'L3MON4D3/LuaSnip',
                tag = 'v2.*',
                run = 'make install_jsregexp',
                requires = { 'rafamadriz/friendly-snippets' },
            },
        }
    }

    use { 'theprimeagen/vim-be-good' }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- DAP
    use { 'mfussenegger/nvim-dap' }
    use { 'mxsdev/nvim-dap-vscode-js', requires = { 'mfussenegger/nvim-dap' } }
    use {
        'microsoft/vscode-js-debug',
        opt = true,
        run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
        tag = 'v1.*'
    }
    use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'unisonweb/unison',
        branch = 'trunk',
        rtp = '/editor-support/vim'
    }
    vim.o.runtimepath = vim.o.runtimepath ..
    ',/Users/colaborador/.local/share/nvim/site/pack/packer/start/unison/editor-support/vim'
end)
