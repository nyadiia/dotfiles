-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'plugins'
require 'lsp'
require 'colors'
require('lualine').setup {
  options = { theme  = "palenight" },
  extensions = { 'nvim-tree' }
}
require('nvim-tree').setup {
  hijack_cursor = true,
  update_cwd = true
}
require('bufferline').setup()

vim.cmd ([[
set nu
set tabstop=2
set shiftwidth=2
set expandtab
nnoremap <C-b> :NvimTreeFocus<CR>
]])

vim.cmd.colorscheme "catppuccin"
