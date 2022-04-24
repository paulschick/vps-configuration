local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer... restart Neovim")
    vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use({
        "wbthomason/packer.nvim",
        -- lsp
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "jose-elias-alvarez/null-ls.nvim",
        "neovim/nvim-lspconfig",
        "saadparwaiz1/cmp_luasnip",
        "tamago324/nlsp-settings.nvim",
        "williamboman/nvim-lsp-installer",

        -- colorscheme
        "folke/tokyonight.nvim",

        "windwp/nvim-autopairs",
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-tree.lua",

    })
    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
end)