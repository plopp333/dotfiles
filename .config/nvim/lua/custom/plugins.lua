local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "mypy",
        "pyright",
        "ruff",
      },
    },
  },
  {
    "lervag/vimtex",
    config = function()
      require "custom.configs.vimtex"
    end,
    ft = {
      "tex",
      "bib",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "latex",
        "lua",
        "python",
      },
    },
  },
}
return plugins
