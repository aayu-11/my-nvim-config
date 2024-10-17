return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "none", fg = "#c0caf5" }) -- Popup background and text color
	end,
	opts = {
		window = {
			border = "double", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
			padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
			zindex = 1000,
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "center", -- Center-align the content
		},

		vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#7aa2f7" }), -- Border color
		-- Your additional options can go here if needed
	},
	triggers = {
		{ "<leader>", mode = { "n", "v" } },
	},
}
