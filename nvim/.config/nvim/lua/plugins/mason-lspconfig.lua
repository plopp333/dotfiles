-- LSP Config: Language Servers (modern API)
return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",   -- LUA
                "pyright",  -- python
                "ruff",
                "marksman", -- Markdown
                "texlab",   -- LaTeX
                "hyprls",   -- Hyprland
                "jsonls",   -- JSON
            },
        })
    end,
}
