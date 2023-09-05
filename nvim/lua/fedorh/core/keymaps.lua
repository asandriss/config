vim.g.mapleader = " "   -- set space as leader key (default is backslash)

local km = vim.keymap

-- general
km.set("i", "jk", "<ESC>") -- typing j and k in short sequence will switch to normal mode (behave like ESC)

km.set("n", "<leader>nh", ":nohl<CR>") -- in normal mode, typing space+nh will clear all hightlights (from search)

km.set("n", "<leader>+", "<C-a>")      -- in normal mode, selecting a number and pressing SPACE+ will increment the value
km.set("n", "<leader>=", "<C-a>")      -- in normal mode, selecting a number and pressing SPACE= will increment the value (to avoid shift key)
km.set("n", "<leader>-", "<C-x>")      -- in normal mode, selecting a number and pressing SPACE- will decrement the value

-- windows and tabs management
km.set("n", "<leader>sv", "<C-w>v") -- split window vertically
km.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
km.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
km.set("n", "<leader>sx", ":close<CR>") -- close current split window

km.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
km.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
km.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
km.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- plugin related keybinding
km.set("n", "<leader>sm", ":MaximizerToggle<CR>")    -- use split maximizer
