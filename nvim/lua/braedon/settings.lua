vim.g.mapleader = " "

-- search highlighting when you want it
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.relativenumber = true
vim.opt.nu = true

--spacing
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4

-- undotree stuff??
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- folding stuff
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"

-- Make background transparent so Alacritty opacity shows through
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
]])
