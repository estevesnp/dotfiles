return {
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function()
				local gitsigns = require("gitsigns")

				local map = CreateNamedMap("gitsigns")

				-- Navigation
				local nextChangeBind = "<leader>cn"
				local prevChangeBind = "<leader>cp"
				map("n", nextChangeBind, function()
					if vim.wo.diff then
						vim.cmd.normal({ nextChangeBind, bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, "Jump to next git change")

				map("n", prevChangeBind, function()
					if vim.wo.diff then
						vim.cmd.normal({ prevChangeBind, bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, "Jump to previous git change")

				-- Actions
				map("v", "<leader>hr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "reset git hunk")
				map("n", "<leader>hr", gitsigns.reset_hunk, "git [r]eset hunk")
				map("n", "<leader>hR", gitsigns.reset_buffer, "git [R]eset buffer")
				map("n", "<leader>hp", gitsigns.preview_hunk, "git [p]review hunk")
				map("n", "<leader>hb", gitsigns.blame_line, "git [b]lame line")
				map("n", "<leader>hd", gitsigns.diffthis, "git [d]iff against index")
				map("n", "<leader>hD", function()
					gitsigns.diffthis("@")
				end, "git [D]iff against last commit")

				-- Toggles
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "[T]oggle git show [b]lame line")
				map("n", "<leader>td", gitsigns.toggle_deleted, "[T]oggle git show [D]eleted")
			end,
		},
	},
}
