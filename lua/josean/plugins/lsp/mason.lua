return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

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

		-- Configure LSP servers to install
		local servers = {
			"html",
			"cssls",
			"tailwindcss",
			"svelte",
			"lua_ls",
			"graphql",
			"emmet_ls",
			"prismals",
			"pyright",
			"ts_ls",
		}

		-- Setup mason-tool-installer with LSP servers
		mason_tool_installer.setup({
			ensure_installed = {
				-- LSP servers
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"typescript-language-server",
				"eslint-lsp",
				-- Formatters and linters
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
