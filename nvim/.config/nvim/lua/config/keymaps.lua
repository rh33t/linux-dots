vim.keymap.set("n", "vva", "ggVG", { desc = "Select all content in buffer" })
vim.keymap.set("n", "<leader>vso", "<cmd>source <CR>", { desc = "Source current lua file" })

-- always center cursor when am navigating up or down
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- remap to keep os clipboard unmodified unless i make it
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- deletes the selected text without saving it to any register and then pastes the most recent text from the default register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- switch between projects !
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- am not using Q letter so
vim.keymap.set("n", "Q", ":q<CR>")

-- make script executable
vim.keymap.set("n", "<leader>xxx", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>or", function()
  vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" }, diagnostics = {} }, apply = true })
end, { noremap = true, silent = true, desc = "Organize Imports" })

vim.keymap.set("n", "<leader>e", function()
  Snacks.picker.explorer({ hidden = true, include = { ".*" } })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-n>", function()
  Snacks.picker.explorer({ hidden = true, include = { ".*" } })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })

-- map source action for fast triggering hihi :xD
vim.keymap.set("n", "<A-a>", function()
  vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} }, apply = true })
end, { noremap = true, silent = true })
