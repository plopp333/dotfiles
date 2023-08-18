local M = {}

M.general = {
  n = {
    ["<C-h>"] = {"<cmd> TmuxNaviagteLeft<CR>", "window left"},
    ["<C-l>"] = {"<cmd> TmuxNaviagteRight<CR>", "window right"},
    ["<C-j>"] = {"<cmd> TmuxNaviagteDown<CR>", "window down"},
    ["<C-k>"] = {"<cmd> TmuxNaviagteUp<CR>", "window up"},
  }
}

return M
