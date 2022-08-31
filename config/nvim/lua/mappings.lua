local m = require('mapx').setup{}

local vsnip_mappings = {
  ["<C-x><C-x>"] = "vsnip#expandable() ? '<Plug>'(vsnip-expand)' : '%s'",
  ["<C-j>"] = "vsnip#available(1) ? '<Plug>'(vsnip-expand-or-jump)' : '%s'",
  ["<Tab>"] = "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '%s'",
  ["<S-Tab>"] = "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-prev)' : '%s'"
}

for keys in pairs(vsnip_mappings) do
  local mapping = string.format(vsnip_mappings[keys], keys)
  m.imap(keys, mapping, "expr")
  m.smap(keys, mapping, "expr")
end

--[[ local vsnip_text_mappings = {
  s = "<Plug>(vsnip-select-text)",
  S = "<Plug>(vsnip-cut-text)"
}

for keys in pairs(vsnip_text_mappings) do
  m.nmap(keys, vsnip_text_mappings[keys])
  m.xmap(keys, vsnip_text_mappings[keys])
end
 ]]

m.nnoremap('<M-TAB>', '<C-w><C-w>')
m.nnoremap('<M-S-TAB>', '<C-w><C-p>')
m.nnoremap('<C-tab>', ':bn<cr>')
m.nnoremap('<C-s-tab>', ':bp<cr>')

-- Spell checking
m.nnoremap('<leader>ss', ':setlocal spell!<cr>')
m.map('<leader>sn', ']s')
m.map('<leader>sp', '[s')
m.map('<leader>sa', 'zg')
m.map('<leader>s?', 'z=')
m.map('<leader>v', ':vsp $MYVIMRC<CR>')
m.map('<leader>V', ':source $MYVIMRC<CR>')
m.nmap('<leader>o', '<cmd>Telescope find_files<CR>', 'silent')
m.nmap('<leader>t', '<cmd>Telescope tags<CR>', 'silent')
m.nmap('<leader>b', '<cmd>Telescope buffers<CR>', 'silent')
m.nnoremap('<leader>nt', ':NvimTreeToggle<CR>', 'silent')
m.nnoremap('<leader>tl', ':TagbarToggle<CR>', 'silent')
-- Searching
m.nnoremap('/', '/\\v')
m.vnoremap('/', '/\\v')
m.nnoremap('<leader>,', ':noh<CR>')
local keys_to_disable = { "<up>", "<down>", "<left>", "<right>" }
for _, key in ipairs(keys_to_disable) do
  m.nnoremap(key, "<nop>")
  m.inoremap(key, "<nop>")
end
m.inoremap('<c-l>', '<c-k>l*')
m.nnoremap('j', 'gj')
m.nnoremap('k', 'gk')
m.nnoremap(';', ':')
m.nnoremap('<leader>w', '<C-w>v<C-w>l')
m.map('<S-Enter>', 'O<Esc')
m.map('<c-Enter>', 'o<Esc')
m.nnoremap('<leader>xx', '<cmd>Trouble<cr>', 'silent')
m.nnoremap('<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>', 'silent')
m.nnoremap('<leader>xd', '<cmd>Trouble document_diagnostics<cr>', 'silent')
m.nnoremap('<leader>xl', '<cmd>Trouble loclist<cr>', 'silent')
m.nnoremap('<leader>xq', '<cmd>Trouble quickfix<cr>', 'silent')
m.nnoremap('gR', '<cmd>Trouble lsp_references<cr>', 'silent')
m.nnoremap('<leader>1', '<cmd>DocsViewToggle<CR>')

m.nnoremap("<leader>rp", "<cmd>VimuxPromptCommand<CR>")
m.nnoremap("<leader>rl", "<cmd>VimuxRunLastCommand<CR>")

m.nmap("<Leader>a=", "<cmd>Tabularize /=<CR>")
m.vmap("<Leader>a=", "<cmd>Tabularize /=<CR>")
m.nmap("<Leader>a:", "<cmd>Tabularize /:\\zs<CR>")
m.vmap("<Leader>a:", "<cmd>Tabularize /:\\zs<CR>")

m.nnoremap("<Leader>tt", "<cmd>TestFile<CR>")

m.vmap("v", "<Plug>(expand_region_expand)")
m.vmap("<C-v>", "<Plug>(expand_region_shrink)")

m.inoremap("jj", "<Esc>")

-- Use | and _ to split windows (while preserving original behaviour of [count]bar and [count]_).
m.nnoremap("<Bar>",
  'v:count == 0 ? "<C-W>v<C-W><Right>" : ":<C-U>normal! 0".v:count."<Bar><CR>"',
  "expr", "silent")
m.nnoremap("_",
  'v:count == 0 ? "<C-W>s<C-W><Down>" : ":<C-U>normal! 0".v:count."_<CR>"',
  "expr", "silent")

m.nnoremap("<leader>gg", "<cmd>LazyGit<CR>", "silent")

require('leap').set_default_keymaps()

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
  "v",
  "<leader>rr",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)
-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
vim.api.nvim_set_keymap("n", "<leader>rv", ":lua require('refactoring').debug.print_var({ normal = true })<CR>", { noremap = true })
-- Remap in visual mode will print whatever is in the visual selection
vim.api.nvim_set_keymap("v", "<leader>rv", ":lua require('refactoring').debug.print_var({})<CR>", { noremap = true })
-- Cleanup function: this remap should be made in normal mode
vim.api.nvim_set_keymap("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })
