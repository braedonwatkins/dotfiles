return {
  {
    -- start with mason since it needs to be loaded first
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    priority = 100
  },
  {
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    -- ensure languages are installed
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
		      "tailwindcss",
		      "cssls",
		      "html",
		      "svelte",
		      "marksman",
		      "omnisharp",
		      "tflint",
		      "terraformls",
	      }
      })

      -- generic server configs
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
                  globals = { 'vim' }
                }
              }
            }
          })
        end,
	["ccls"] = function ()
		lspconfig.ccls.setup({
			capabilities = capabilities,
			flags = {
				debounce_text_changes = 150,
			},
			init_options = {
				compilationDatabaseDirectory = "build",
				cache = {
					directory = "/tmp/ccls-cache",
				},
			},
		})
	end,
      })

      -- Key mappings
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end,
      })
    end
  }
}
