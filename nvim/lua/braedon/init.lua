require("braedon.lazy")
require("braedon.remaps")
require("braedon.settings")
require("braedon.plugins.lsp")

require("oil").setup()

-- auto open (within reason)
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local argv = vim.fn.argv()
        if #argv == 0 then
            -- needs this bc it can open dir before nvim is ready unlike when provided an argument (says the LLMs)
            vim.schedule(function()
                vim.cmd("Oil .")
            end
            )
        elseif vim.fn.isdirectory(argv[1]) == 1 then
            vim.cmd("Oil " .. argv[1])
        end
    end,
})
