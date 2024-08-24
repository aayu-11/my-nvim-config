return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
			session_lens = {
				buftypes_to_ignore = {}, -- Filetypes that should not be included in a session
				load_on_setup = true, -- When SessionLoad is called, should it load the session?
				theme_conf = { border = true }, -- Options for session lens border and title
				previewer = true, -- Show preview of session on hover
			},
			vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
				noremap = true,
			}),
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
	end,
}
