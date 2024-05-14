vim.g.mapleader = " "

-- Simple bindings
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex, { desc = "Open Net[R][W]" })
vim.keymap.set("n", "<leader>rl", "<cmd>LspRestart<CR>", { desc = "[R]estart [L]SP" })

-- Makes <C-c> work as <Esc> in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Remove search highlights after pressing <Esc>
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append to end of line without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Leave cursos in the middle when moving up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Leave selection in the middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "[y]ank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "[y]ank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "[Y]ank to system clipboard" })

-- Preserve paste register over selection
vim.keymap.set("x", "<leader>p", '"_dP')

-- Delete to void register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, { desc = "Go to [P]revious [D]iagnostic message" })
vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { desc = "Go to [N]ext [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Splits keymaps
vim.keymap.set("n", "<C-w>h", "<cmd>vsplit<CR>", { desc = "Split [H]orizontally" })
vim.keymap.set("n", "<C-w>v", "<cmd>split<CR>", { desc = "Split [V]ertically" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +<CR>", { desc = "Increase height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -<CR>", { desc = "Decrease height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +5<CR>", { desc = "Increase width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -5<CR>", { desc = "Decrease width" })
