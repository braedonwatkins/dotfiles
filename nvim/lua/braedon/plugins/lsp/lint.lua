return {
    "mfussenegger/nvim-lint",
    event = { "bufwritepost", "bufreadpost", "insertleave" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint" },
            typescript = { "eslint" },
            javascriptreact = { "eslint" },
            typescriptreact = { "eslint" },
        }

        vim.api.nvim_create_autocmd({ "bufwritepost", "bufreadpost", "insertleave" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
