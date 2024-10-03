-- ~/.config/nvim/lua/plugins.lua
return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency

		config = function()
			require("harpoon").setup({
				-- Optional configuration options for Harpoon
				global_settings = {
					save_on_toggle = false,
					save_on_change = true,
					enter_on_sendcmd = false,
				},
			})

			-- Setup keybindings for Harpoon
			-- Add current file to Harpoon marks
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ha",
				":lua require('harpoon.mark').add_file()<CR>",
				{ noremap = true, silent = true }
			)

			-- Show Harpoon menu
			vim.api.nvim_set_keymap(
				"n",
				"<leader>hh",
				":lua require('harpoon.ui').toggle_quick_menu()<CR>",
				{ noremap = true, silent = true }
			)

			-- Navigate between specific Harpoon marks (1-4)
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

			-- Navigate between Harpoon files (Next and Previous)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>hn",
				":lua require('harpoon.ui').nav_next()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>hp",
				":lua require('harpoon.ui').nav_prev()<CR>",
				{ noremap = true, silent = true }
			)

			-- Optional: Telescope integration
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
