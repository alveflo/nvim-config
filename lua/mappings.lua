require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--### Personal configs

--## Common (insert + normal)
map({"i","n"}, "<C-z>", "<C-o>u", { desc = "Undo" })
map({"i", "n"}, "<C-Down>", "<C-e>", { desc = "Scroll down" })
map({"i", "n"}, "<C-Up>", "<C-y>", { desc = "Scroll up" })

--## Normal mode
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files (telescope)" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep files (telescope)" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers (telescope)" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols (telescope)" })

-- Search current document with CTRL+f
map("n", "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Find in current buffer (telescope)" })


--## Visual mode
map("v", "<C-c>", '"+y', { desc = "Copy to clipboard" })

-- ## Insert mode
map("i", "<C-v>", "<ESC>^p", { desc = "Paste from clipboard" })
map("i", "<M-BS>", "<C-w>", { desc = "Delete word backward" })
map("i", "<S-Tab>", "<C-d>", { desc = "Decrease current indent level" })
