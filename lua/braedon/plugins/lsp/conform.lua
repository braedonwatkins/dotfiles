return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
			},

			formatters = {
				prettier = {
					prepend_args = { "--config-precedence", "prefer-file" },
				},
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
