---------------------------
--------- OPTIONS ---------
---------------------------

-- block cursor
vim.o.guicursor = ""
vim.o.cursorline = true

-- relative line number
vim.o.number = true
vim.o.relativenumber = true

-- tab / indentation opts
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.smartindent = true

-- / opts
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = "split"

-- ask before erroring (e.g. closing unsaved file)
vim.o.confirm = true

-- always show gutter
vim.o.signcolumn = "yes"

-- disable wrap text
vim.o.wrap = false

-- line at col 80
vim.o.colorcolumn = "80"

-- top and bottom scrollof
vim.o.scrolloff = 5

-- key combination timeout
vim.o.updatetime = 50
vim.o.timeoutlen = 300

-- border around floating windows (e.g. K)
vim.o.winborder = "single"

-- folds
vim.o.foldenable = false
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- netrw relative line number
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"
vim.g.netrw_banner = 0

-- colorscheme
vim.cmd("colorscheme lunaperche")

---------------------------
--------- KEYMAPS ---------
---------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

map("i", "<C-c>", "<Esc>", { desc = "exit insert mode" })
map("n", "<Esc>", function()
  vim.snippet.stop()
  vim.cmd("nohlsearch")
end, { desc = "remove search and snippet highlights" })

-- clipboard / paste buffer
map({ "n", "x" }, "<leader>y", '"+y', { desc = "yank to system clipboard" })
map({ "n", "x" }, "<leader>d", '"_d', { desc = "delete to void register" })
map({ "n", "x" }, "<leader>c", '"_c', { desc = "change preserving paste buffer" })
map("x", "<leader>p", '"_dP', { desc = "paste preserving paste buffer" })

-- diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "show diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostic quickfix list" })

-- quickfix list
map("n", "co", ":copen<CR>", { desc = "open quickfix list" })
map("n", "cq", ":cclose<CR>", { desc = "close quickfix list" })

-- jump tabs
map("n", "]t", "<cmd>tabnext<CR>", { desc = "next tab" })
map("n", "[t", "<cmd>tabprevious<CR>", { desc = "previous tab" })

-- center after navigation
map("n", "n", "nzzzv", { desc = "next search and center cursor" })
map("n", "N", "Nzzzv", { desc = "previous search and center cursor" })
map("n", "<C-d>", "<C-d>zz", { desc = "half page down and center cursor" })
map("n", "<C-u>", "<C-u>zz", { desc = "half page up and center cursor" })

-- split horizontally to match tmux. still have <C-w>v for vertical and <C-w>s for horizontal
map("n", "<C-w>b", ":split<CR>", { desc = "split buffer horizontally" })

-- netrw
map("n", "<leader>rw", "<cmd>Ex<CR>", { desc = "open netrw" })
map("n", "-", "<cmd>Ex<CR>", { desc = "open netrw" })

-- source lua
map("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "source lua file" })
map({ "n", "x" }, "<leader>x", ":.lua<CR>", { desc = "source lua selection" })

----------------------------
--------- AUTOCMDS ---------
----------------------------

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
