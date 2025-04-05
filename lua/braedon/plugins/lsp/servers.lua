return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			-- special server configs
			["lua_ls"] = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			end,
			-- FIXME: for when i do c++/embedded
			-- ["ccls"] = function()
			-- 	lspconfig.ccls.setup({
			-- 		capabilities = capabilities,
			-- 		flags = {
			-- 			debounce_text_changes = 150,
			-- 		},
			-- 		init_options = {
			-- 			compilationDatabaseDirectory = "build",
			-- 			cache = {
			-- 				directory = "/tmp/ccls-cache",
			-- 			},
			-- 		},
			-- 	})
			-- end,
		})

		-- lsp defined keymappings TODO: see if these can be better abstracted
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end,
		})
	end,
}
-- Set up lint events
