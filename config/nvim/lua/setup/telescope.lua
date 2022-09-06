local telescope = require('telescope')

local options = {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    prompt_prefix = "   ",
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    color_devicons = true
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

telescope.setup(options)
telescope.load_extension("lazygit")
telescope.load_extension("refactoring")
telescope.load_extension('lsp_handlers')
telescope.load_extension("fzf")


