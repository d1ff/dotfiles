local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

local winbar = {
  lualine_a = {'filename' },
  lualine_b = {{ 'diff', source = diff_source }},
  lualine_c = {},
  lualine_x = { function()
     return vim.fn['nvim_treesitter#statusline']("90")
  end},
  lualine_y = {'diagnostics'},
  lualine_z = {}
}

require('lualine').setup {
  options = {
      theme = 'solarized',
      globalstatus = true,
      disabled_filetypes = {
        statusline = {},
        winbar = { 'tagbar', 'NvimTree' },
      },
  },
  sections = {
      lualine_a = {'mode'},
      lualine_b = { },
      lualine_c = { },
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
  },
  tabline = {
    lualine_a = {},
    lualine_b = { { 'b:gitsigns_head', icon = '' }, },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'buffers'},
    lualine_z = {'tabs'}
  },
  winbar = winbar,
  inactive_winbar = winbar  
} 

