-- autocommand that reloads neovim and installs/updates/removes plugins when files is saved
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

--auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end



return packer.startup(function(use)
    use("wbthomason/packer.nvim")   -- packer plugin, it manages itself

    use("nvim-lua/plenary.nvim")    -- library that other plugins use

    use("bluz71/vim-nightfly-guicolors") -- color scheme, it can be any repo

    use("christoomey/vim-tmux-navigator") -- allow ctrl+hjkl to move around the open splits

    use("szw/vim-maximizer") -- allow keybinding to maximize and restore splits

    -- essential??? plugins
    use("tpope/vim-surround") -- sorround word with selected char like quotes - check the docs
    use("vim-scripts/ReplaceWithRegister")  -- replace the word under cursor with text from clipboard

    use("numToStr/Comment.nvim")    -- makes commenting out lines easier, needs config; in normal mode do GC5J to comment/uncomment 5 lines or GCC to comment current line

    --file explorer
    use("nvim-tree/nvim-tree.lua")
    use("kyazdani42/nvim-web-devicons") -- icons for the explorer

    --status line
    use("nvim-lualine/lualine.nvim")

    -- telescope fuzzy find
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope.nvim", branch="0.1.x" })

    -- code autocomplete
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")

    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    use("simrat39/rust-tools.nvim")
    use({"rust-lang/rust.vim", ft="rust", init = function() 
            vim.g.rustfmt_autosave = 1
        end })

    -- LSP Block
    -- managing and installing LSP servers
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    
    --configuring the LSP servers
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")                   -- smart autocomplete
    use({"glepnir/lspsaga.nvim", branch="main"})
    --use("jose-elias-alvarez/typescript.nvim")   -- typescript specific
    use("onsails/lspkind.nvim")             -- icons for auto completion window
    
    -- END LSP Block

    if packer_bootstrap then
        require("packer").sync()
    end
end)
