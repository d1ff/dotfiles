require('lualine').setup {
    options = {
        theme = 'solarized',
        globalstatus = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'diagnostics', 'filename' },
        lualine_c = { function()
             return vim.fn['nvim_treesitter#statusline']("90")
          end
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    tabline = {
      lualine_a = {},
      lualine_b = {'branch', 'diff'},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {'buffers'},
      lualine_z = {'tabs'}
    }
}

