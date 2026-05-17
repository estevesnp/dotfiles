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

-- swapfiles
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = false

-- diagnostics
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = false,
  underline = false,
})

-- colorscheme
vim.cmd("colorscheme lunaperche")

---------------------------
--------- KEYMAPS ---------
---------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- ctrl+c and esc
map("i", "<C-c>", "<Esc>", { desc = "exit insert mode" })
map("n", "<Esc>", function()
  vim.cmd("nohlsearch")
  vim.snippet.stop()
  vim.lsp.buf.clear_references()
end, { desc = "remove search, snippet and lsp highlights" })

-- clipboard / paste buffer
map({ "n", "x" }, "<leader>y", '"+y', { desc = "yank to system clipboard" })
map({ "n", "x" }, "<leader>d", '"_d', { desc = "delete to void register" })
map({ "n", "x" }, "<leader>c", '"_c', { desc = "change preserving paste buffer" })
map("x", "<leader>p", '"_dP', { desc = "paste preserving paste buffer" })

-- quickfix list
map("n", "<leader>qo", ":copen<CR>", { desc = "open quickfix list" })
map("n", "<leader>qc", ":cclose<CR>", { desc = "close quickfix list" })

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
map({ "n", "x" }, "<leader>x", ":.lua<CR>", { desc = "source lua selection" })
map("n", "<leader>X", "<cmd>source %<CR>", { desc = "source lua file" })

-- diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "show diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "open diagnostic quickfix list" })

-- undotree
vim.cmd("packadd nvim.undotree")
map("n", "<leader>u", ":Undotree<CR>", { desc = "toggle undotree" })

-- term
map("n", "<leader>T", ":tab term<CR>", { desc = "open terminal in new tab" })
map("n", "<leader>R", function()
  vim.ui.input({ prompt = "run: " }, function(cmd)
    if cmd and cmd ~= "" then
      vim.cmd("vnew")
      vim.fn.jobstart(cmd, { term = true })
    end
  end)
end, { desc = "run shell command in a new split" })

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
