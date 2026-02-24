-- Linter/Formatter installation
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua", -- LUA
				"prettier", --Python
				"black",
			},
		})
	end,
}
