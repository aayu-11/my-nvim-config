-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("t", "kj", [[<C-\><C-n>]], { noremap = true, silent = true })
keymap.set("n", "<leader>tt", ":term<CR>", { noremap = true, silent = true })

-- keymap to save file
vim.api.nvim_set_keymap("n", "<leader>uf", ":update<CR>", { noremap = true, silent = true })

-- Map <leader>zza to :bufdo update
vim.api.nvim_set_keymap("n", "<leader>ua", ":bufdo update<CR>", { noremap = true, silent = true })

-- keymap to exit vim
vim.api.nvim_set_keymap("n", "<leader>qq", ":q<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>qaa", ":qa<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>qaf", ":qa!<CR>", { noremap = true, silent = true })

-- keymap to shift a visually selected block of code to up or down

vim.api.nvim_set_keymap("x", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Local copy and paste
vim.api.nvim_set_keymap("n", "y", '"0y', { noremap = true })
vim.api.nvim_set_keymap("n", "p", '"0p', { noremap = true })
vim.api.nvim_set_keymap("v", "y", '"0y', { noremap = true })
vim.api.nvim_set_keymap("v", "p", '"0p', { noremap = true })
vim.api.nvim_set_keymap("x", "y", '"0y', { noremap = true })
vim.api.nvim_set_keymap("x", "p", '"0p', { noremap = true })

-- System clipboard copy and paste
vim.api.nvim_set_keymap("n", "Y", '"+yy', { noremap = true })
vim.api.nvim_set_keymap("n", "P", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "Y", '"+yy', { noremap = true })
vim.api.nvim_set_keymap("v", "P", '"+p', { noremap = true })
vim.api.nvim_set_keymap("x", "Y", '"+yy', { noremap = true })
vim.api.nvim_set_keymap("x", "P", '"+p', { noremap = true })

-- Copy the current line to local buffer
vim.api.nvim_set_keymap("n", "yy", "yy", { noremap = true })

-- Copy the current line to the system clipboard
vim.api.nvim_set_keymap("n", "YY", '"+yy', { noremap = true })
