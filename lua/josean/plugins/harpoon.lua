-- ~/.config/nvim/lua/plugins.lua
return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			-- Set up highlight group for harpoon border
			vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#00919f" }) -- Using the green from your colorscheme

			require("harpoon").setup({
				global_settings = {
					save_on_toggle = false,
					save_on_change = true,
					enter_on_sendcmd = false,
				},
				menu = {
					width = 50,
					height = 12,
					borderchars = {
						"─",
						"│",
						"─",
						"│",
						"╭",
						"╮",
						"╯",
						"╰",
					},
				},
			})

			-- Override the menu UI to use our custom border color
			local orig_menu = require("harpoon.ui").toggle_quick_menu
			require("harpoon.ui").toggle_quick_menu = function()
				orig_menu()
				-- Get the current window
				local win = vim.api.nvim_get_current_win()
				-- Set the window border highlight
				vim.api.nvim_win_set_option(win, "winhl", "FloatBorder:HarpoonBorder")
			end

			-- Rest of your keybindings remain the same...
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ha",
				":lua require('harpoon.mark').add_file()<CR>",
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>hh",
				":lua require('harpoon.ui').toggle_quick_menu()<CR>",
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>gh",
				":lua require('harpoon.ui').nav_file(1)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gj",
				":lua require('harpoon.ui').nav_file(2)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gk",
				":lua require('harpoon.ui').nav_file(3)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gl",
				":lua require('harpoon.ui').nav_file(4)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>g;",
				":lua require('harpoon.ui').nav_file(5)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gy",
				":lua require('harpoon.ui').nav_file(6)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gu",
				":lua require('harpoon.ui').nav_file(7)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gi",
				":lua require('harpoon.ui').nav_file(8)<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>go",
				":lua require('harpoon.ui').nav_file(9)<CR>",
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>gn",
				":lua require('harpoon.ui').nav_next()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>gp",
				":lua require('harpoon.ui').nav_prev()<CR>",
				{ noremap = true, silent = true }
			)

			vim.api.nvim_set_keymap(
				"n",
				"<leader>ht",
				":Telescope harpoon marks<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
	-- Add other plugins here
}
