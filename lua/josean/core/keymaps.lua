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

-- tab management
-- tab and shift tab to navigate between tabs cyclically
keymap.set("n", "<TAB>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<S-TAB>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("t", "<ESC>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- keymap to exit vim
keymap.set("n", "<leader>ww", ":w<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>wa", ":wa<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>qq", ":q<CR>", { noremap = true, silent = true })

keymap.set("n", "<leader>qa", ":qa<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>qfa", ":qa!<CR>", { noremap = true, silent = true })

keymap.set("n", "<leader>wq", ":wq<CR>", { noremap = true, silent = true })

keymap.set("n", "<leader>wQ", ":wqa<CR>", { noremap = true, silent = true })
-- keymap to shift a visually selected block of code to up or down

keymap.set("x", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("x", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true })

keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

keymap.set("v", "<leader>p", '"_dP', { noremap = true, silent = true })
keymap.set("x", "<leader>p", '"_dP', { noremap = true, silent = true })

keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })
keymap.set("x", "<leader>y", '"+y', { noremap = true, silent = true })
keymap.set("n", "<leader>Y", '"+Y', { noremap = true, silent = true })

keymap.set("n", "<leader>dd", '"_d', { noremap = true, silent = true })
keymap.set("v", "<leader>dd", '"_d', { noremap = true, silent = true })
keymap.set("x", "<leader>dd", '"_d', { noremap = true, silent = true })
-- -- Local copy and paste
-- keymap.set("n", "yy", '"0y', { noremap = true })
-- keymap.set("n", "<leader>p", '"0p', { noremap = true })
-- keymap.set("v", "y", '"0y', { noremap = true })
-- keymap.set("v", "<leader>p", '"0p', { noremap = true })
-- keymap.set("x", "y", '"0y', { noremap = true })
-- keymap.set("x", "<leader>p", '"0p', { noremap = true })
--
-- -- System clipboard copy and paste
-- keymap.set("n", "Y", '"+yy', { noremap = true })
-- keymap.set("n", "P", '"+p', { noremap = true })
-- keymap.set("v", "Y", '"+yy', { noremap = true })
-- keymap.set("v", "P", '"+p', { noremap = true })
-- keymap.set("x", "Y", '"+yy', { noremap = true })
-- keymap.set("x", "P", '"+p', { noremap = true })

-- Copy the current line to local buffer
keymap.set("n", "yy", "yy", { noremap = true })

-- Copy the current line to the system clipboard
keymap.set("n", "YY", '"+yy', { noremap = true })
-- Example keymap to search Neovim help using Telescope
keymap.set(
	"n", -- Normal mode keymap
	"<leader>fh", -- Keybinding (you can change this to your preference)
	":Telescope help_tags<CR>", -- Command to search help tags using Telescope
	{ noremap = true, silent = true } -- Non-recursive and silent
)

keymap.set("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true, silent = true })

-- Resize splits in vim motion directions
keymap.set("n", "<M-j>", ":resize +2<CR>", { silent = true }) -- Increase height (downwards)
keymap.set("n", "<M-k>", ":resize -2<CR>", { silent = true }) -- Decrease height (upwards)
keymap.set("n", "<M-h>", ":vertical resize -2<CR>", { silent = true }) -- Decrease width (left)
keymap.set("n", "<M-l>", ":vertical resize +2<CR>", { silent = true }) -- Increase width (right)
