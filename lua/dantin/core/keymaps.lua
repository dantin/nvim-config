-- set leader key to ,
vim.g.mapleader = ","

-- for conciseness
local keymap = vim.keymap

---------------------
-- General Keymaps --
---------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear Search Highlights" })

-- window management
-- split window vertically
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
-- split window horizontally
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
-- make split windows equal width
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make Split Windows Equal Size" })
-- close current split window
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Current Split Window" })

-- open new tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open New Tab" })
-- close current tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })
-- goto next tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to Next Tab" })
-- goto previous tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to Previous Tab" })
-- move current buffer to new tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open Current Buffer in New Tab" })
