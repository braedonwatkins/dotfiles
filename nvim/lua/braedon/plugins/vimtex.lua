-- ~/.config/nvim/lua/plugins/latex.lua
return {
    "lervag/vimtex",
    lazy = false,
    ft = { "tex" },
    config = function()
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_mappings_enabled = 1
        vim.g.vimtex_imaps_enabled = 1
        vim.g.vimtex_complete_enabled = 1

        vim.opt.conceallevel = 2
        vim.g.vimtex_syntax_conceal = {
            accents = 1,
            ligatures = 1,
            cites = 1,
            fancy = 1,
            spacing = 1,
            greek = 1,
            math_bounds = 0,
            math_delimiters = 1,
            math_fracs = 1,
            math_super_sub = 1,
            math_symbols = 1,
            sections = 0,
            styles = 1,
        }
    end,
}
