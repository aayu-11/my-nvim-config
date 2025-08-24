return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		-- Set toggleterm colors directly
		vim.api.nvim_set_hl(0, "ToggleTermBorder", { fg = "#00919f", bg = "NONE" })
		vim.api.nvim_set_hl(0, "ToggleTermNormal", { bg = "NONE" })

		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = "/bin/zsh",
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "FloatBorder",
					background = "NormalFloat",
				},
			},
		})

		-- Create a custom command for lazygit
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			float_opts = {
				border = "curved",
				width = 120.0,
				height = 35.0,
				highlights = {
					border = "FloatBorder",
					background = "NormalFloat",
				},
			},
			close_on_exit = true,
		})

		-- Function to toggle lazygit
		local function _lazygit_toggle()
			lazygit:toggle()
		end

		-- Register the command
		vim.api.nvim_create_user_command("LazyGit", _lazygit_toggle, {})
	end,
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
	},
}
