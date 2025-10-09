local set = vim.opt

set.nu = true
set.relativenumber = true

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true

set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.timeout = true
set.timeoutlen = 100

set.mouse = ""
