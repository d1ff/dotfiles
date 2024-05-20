local function get_setup(name)
    return string.format('require("setup/%s")', name)
end

local devicons = 'kyazdani42/nvim-web-devicons' -- optional, for file icons
local plenary = 'nvim-lua/plenary.nvim'

local function define_packages(use)
    use 'stevearc/dressing.nvim'
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
    use 'mg979/vim-visual-multi'
    use 'smjonas/inc-rename.nvim'
    use 'raimondi/delimitmate'
    use 'icymind/NeoSolarized'
    use 'idanarye/vim-merginal'
    use {
        'lewis6991/gitsigns.nvim',
        event = 'VimEnter',
        config = function()
            require('gitsigns').setup()
        end
    }
    use 'christoomey/vim-tmux-navigator'
    use { 'godlygeek/tabular', cmd = "Tabular" }
    use 'majutsushi/tagbar'
    use 'moll/vim-bbye'
    use {
        "lukas-reineke/indent-blankline.nvim",
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
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
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {
            plenary,
            devicons,
            "kdheepak/lazygit.nvim",
            "gbrlsnchs/telescope-lsp-handlers.nvim",
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
            }
        },
        config = get_setup('telescope')
    }
    use 'szw/vim-tags'
    use 'tmux-plugins/vim-tmux'
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
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline'},
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/vim-vsnip' },
            { "rafamadriz/friendly-snippets" },
            { "onsails/lspkind.nvim" }
        },
        config = get_setup('cmp')
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        config = get_setup("treesitter")
    }
    -- Lua
    use {
      "folke/trouble.nvim",
      requires = { devicons },
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
            { plenary },
            {"nvim-treesitter/nvim-treesitter"}
        },
        config = get_setup('refactoring')
    }
    use {
        'liuchengxu/graphviz.vim'
    }
end

require('packer').startup(define_packages)
