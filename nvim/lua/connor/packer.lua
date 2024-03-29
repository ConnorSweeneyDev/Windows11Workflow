-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    use('ggandor/leap.nvim')

    use
    {
        'nvim-telescope/telescope.nvim',
        requires = 
        {
            'nvim-lua/plenary.nvim'
        }
    }
    use
    {
        'theprimeagen/harpoon', branch = 'harpoon2',
        requires =
        { 
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim'
        } 
    }
    use("gbprod/yanky.nvim")
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use{'neoclide/coc.nvim', branch = 'release'}
    use('github/copilot.vim')

    use('tribela/vim-transparent') 
    use
    {
        'Mofiqul/vscode.nvim',
        as = 'vscode',
        config = function()
            vim.cmd('colorscheme vscode')
        end
    }
    use
    {
        'nvim-lualine/lualine.nvim',
        requires =
        {
            'nvim-tree/nvim-web-devicons', opt = true
        }
    }
    use("nvim-tree/nvim-web-devicons")
end)
