local map = vim.keymap.set

vim.g.mapleader = " "

map({'n', 'x', 'o'}, 'n', 'h' )
map({'n', 'x', 'o'}, 'e', 'j' )
map({'n', 'x', 'o'}, 'i', 'k' )
map({'n', 'x', 'o'}, 'o', 'l' )

map("v", "E", ":m '>+1<CR>gv=gv")
map("v", "I", ":m '<-2<CR>gv=gv")

map('n', 'j', 'i' ) 
map('n', 'l', 'o' ) 
map('n', 'L', 'O' ) 
map('n', 'k', 'e' ) 
map('n', 'K', 'E' )
