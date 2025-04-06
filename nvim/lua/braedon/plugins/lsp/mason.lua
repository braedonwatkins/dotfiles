return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		priority = 100,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ts_ls",
					"lua_ls",
					"gopls",
					"pyright",
					"volar",
					"prismals",
					"rust_analyzer",
					"cssls",
					"html",
					"svelte",
					"marksman",
					"omnisharp",
					"tflint",
					"terraformls",
				},
			})
		end,
	},
}
