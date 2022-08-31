require('packer').startup(function(use)
    local function get_setup(name)
        return string.format('require("setup/%s")', name)
    end
    use {'stevearc/dressing.nvim'}
    use 'lewis6991/impatient.nvim'
    use 'junegunn/vim-slash'
    use 'romainl/vim-cool'
    use {
        "williamboman/mason-lspconfig.nvim",
        requires = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
            'hrsh7th/nvim-cmp',
        },
        config = get_setup('lsp')
    }
    use 'sheerun/vim-polyglot'
    use { 'elzr/vim-json', ft = { 'json' } }
    use 'terryma/vim-multiple-cursors'
    use 'raimondi/delimitmate'
    use { 'calebsmith/vim-lambdify', ft = { 'python' } }
    use 'icymind/NeoSolarized'
    use 'michaeljsmith/vim-indent-object'
    use 'eugen0329/vim-esearch'
    use 'idanarye/vim-merginal'
    use 'benmills/vimux'
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    use 'christoomey/vim-tmux-navigator'
    use 'clones/vim-l9'
    use 'edkolev/promptline.vim'
    use 'edkolev/tmuxline.vim'
    use { 'godlygeek/tabular', cmd = "Tabular" }
    use 'majutsushi/tagbar'
    use 'moll/vim-bbye'
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = true,
            }
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    local devicons = 'kyazdani42/nvim-web-devicons' -- optional, for file icons
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            devicons
        },
        event = "VimEnter",
        config = get_setup('lualine')
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          devicons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = function()
          require('nvim-tree').setup()
      end
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim', devicons, "kdheepak/lazygit.nvim" } },
        config = function()
            local telescope = require('telescope')
            telescope.setup{}
            telescope.load_extension("lazygit")
            telescope.load_extension("refactoring")
        end
    }
    use 'szw/vim-tags'
    use 'terryma/vim-expand-region'
    use 'tmux-plugins/vim-tmux'
    use 'tmux-plugins/vim-tmux-focus-events'
    use 'tpope/vim-abolish'
    use 'tpope/vim-fugitive'
    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({ })
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'hrsh7th/cmp-vsnip'},
            {'hrsh7th/vim-vsnip'},
            {"rafamadriz/friendly-snippets"},
            { "onsails/lspkind.nvim" }
        },
        config = get_setup('cmp')
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        config = get_setup("treesitter")
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = devicons,
        config = get_setup('bufferline')
    }
    -- Lua
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          --
        }
      end
    }
    use {
      "amrbashir/nvim-docs-view",
      opt = true,
      cmd = { "DocsViewToggle" },
      config = function()
        require("docs-view").setup {
          position = "right",
          width = 60,
        }
      end
    }
    use "b0o/mapx.nvim"
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use {
        "ggandor/leap.nvim",
        config = function() 
            local leap = require("leap")
            leap.setup {}
        end
    }
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        },
        config = get_setup('refactoring')
    }
end)

