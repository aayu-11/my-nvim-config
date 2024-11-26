return {
	"folke/trouble.nvim",
	version = "v2.*",
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	keys = {
		{ "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list" },
		{ "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
	},
	config = function()
		require("trouble").setup()

		-- Make the Trouble window background transparent
		vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "TroubleNormalFloat", { bg = "none" })

		-- Optionally, set transparency for other related highlight groups
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
