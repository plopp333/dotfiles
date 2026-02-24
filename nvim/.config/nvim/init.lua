-- ############################ Basic Editor Settings #############################
-- Show absolute line numbers
vim.opt.number = true
-- Show relative line numbers (useful for motions like 5j, 3k)
vim.opt.relativenumber = true
-- Use spaces instead of tabs
vim.opt.expandtab = true
-- Number of spaces for each indentation level
vim.opt.shiftwidth = 4
-- Number of spaces that a <Tab> counts for
vim.opt.tabstop = 4
-- Smart auto-indenting when starting a new line
vim.opt.smartindent = true
vim.opt.autoindent = true
-- Use the system clipboard for yanking/pasting
vim.opt.clipboard = "unnamedplus"
-- Enable 24-bit RGB colors in terminal
vim.opt.termguicolors = true
-- Highlight the line where the cursor is
vim.opt.cursorline = true
-- Do not wrap long lines
vim.opt.wrap = false
-- Set the leader key (used for custom shortcuts)
vim.g.mapleader = " "
-- Set border style for all floating windows
vim.o.winborder = "rounded"
-- Organize imports on write
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.code_action({
            apply = true,
            context = { only = { "source.organizeImports" } },
        })
    end,
})

-- ########################## Plugin Manager: lazy.nvim ###########################
-- Bootstrap lazy.nvim if it is not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("plugins.autopairs"),
    require("plugins.catppuccin"),
    require("plugins.conform"),
    require("plugins.gitsigns"),
    require("plugins.harpoon"),
    require("plugins.mason"),
    require("plugins.mason-lspconfig"),
    require("plugins.mason-tool-installer"),
    require("plugins.nvim-cmp"),
    require("plugins.surround"),
    require("plugins.telescope"),
    require("plugins.telescope-file-browser"),
    require("plugins.treesitter"),
    require("plugins.vimtex"),
    require("plugins.vim-fugitive"),
    require("plugins.which-key"),
})

-- ############################### Custom Commands ################################
require("commands.TSInfo")        -- :TSInfo for treesitter info (filetype)
require("commands.SeperatorLine") -- create Seperator Line

-- ################################ Custom Keymaps ################################
-- this must be loaded as last position after everything else
require("keymaps.custom")
require("keymaps.lsp")
