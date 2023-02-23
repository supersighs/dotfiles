vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- You add plugins here  
  use 'hardselius/warlock'
  use 'EdenEast/nightfox.nvim'
  use 'arzg/vim-substrata'
  use 'sainnhe/gruvbox-material'
  use 'RRethy/nvim-base16'
  use 'nanozuki/tabby.nvim'
  use 'sbdchd/neoformat'
  use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use {                                              -- filesystem navigation
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'        -- filesystem icons
  }

  use {
    'nvim-lualine/lualine.nvim',                     -- statusline
    requires = {'kyazdani42/nvim-web-devicons',
                opt = true}
  }
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = {
	{'ms-jpq/coq.artifacts', branch = 'artifacts'},
	{'ms-jpq/coq.thirdparty', branch = '3p'}
    }
  }
  use {
    'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps'
  }
end)

