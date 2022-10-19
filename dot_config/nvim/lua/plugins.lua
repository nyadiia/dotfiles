-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- vim-closer
  use 'rstacruz/vim-closer'
  -- completion-nvim
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }

  -- barbar
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- vimtex
  use 'lervag/vimtex'
  
  -- deoplete
  use {
  	'Shougo/deoplete.nvim',
	requires = {'roxma/nvim-yarp','roxma/vim-hug-neovim-rpc'}
  }

  -- nvim-treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- nvim tree
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
end)
