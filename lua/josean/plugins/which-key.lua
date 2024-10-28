return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		require("which-key").setup({
			plugins = {
				marks = true, -- shows a list of your marks on ' and `
				registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
			},
			win = {
				border = "rounded",
				padding = { 1, 1 },
				title = " whichKey ",
				title_pos = "center",
			},
			layout = {
				height = { min = 10, max = 25 },
				width = { min = 20, max = 50 },
				spacing = 3,
				align = "left",
			},
		})
		vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "none", fg = "#c0caf5" }) -- Popup background and text color
		vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#00919f" }) -- Border color
	end,
	opts = {
		vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#00919f" }), -- Border color
		-- Your additional options can go here if needed
	},
	triggers = {
		{ "<leader>", mode = { "n", "v" } },
	},
}
