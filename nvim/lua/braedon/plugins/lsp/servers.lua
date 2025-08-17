return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },

    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- weird thing specific to lean idgi
        vim.env.PATH = "/Users/braedon/.elan/bin:" .. vim.env.PATH

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                -- special server configs
                ["leanls"] = function()
                    lspconfig.leanls.setup({
                        cmd = { "lean", "--server" },
                        filetypes = { "lean" },
                        root_dir = lspconfig.util.root_pattern("leanpkg.toml", ".git"),
                    })
                end,
                ["pyright"] = function()
                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "basic",
                                    useLibraryCodeForTypes = true
                                }
                            }
                        }
                    })
                end,
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
            }
        })


        local cmp = require("cmp")

        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
        })

        -- Enable autocompletion
        vim.o.completeopt = "menuone,noselect"

        -- Diagnostic configuration
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                header = "",
                prefix = "",
            },
        })

        -- lsp defined keymappings  TODO: see if these can be better abstracted
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            end,
        })
    end,
}
-- Set up lint events
