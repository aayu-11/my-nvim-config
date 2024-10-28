return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "single",
				colors = {
					normal = { fg = "#9CDCFE" },
					separator = { fg = "#606060" },
					modified = { fg = "#FFCC00" },
					dirname = { fg = "#606060" },
					basename = { fg = "#9CDCFE", bold = true },
					context = { fg = "#9CDCFE" },
					context_function = { fg = "#DCDCAA" },
					context_method = { fg = "#DCDCAA" },
					context_property = { fg = "#9CDCFE" },
					context_variable = { fg = "#9CDCFE" },
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			auto_install = true,
			ensure_installed = {
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}
