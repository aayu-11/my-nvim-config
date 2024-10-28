return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			-- Configure custom kind icons and colors (VS Code style)
			local kinds = {
				File = "󰈙",
				Module = "",
				Namespace = "󰌗",
				Package = "",
				Class = "󰌗",
				Method = "󰆧",
				Property = "",
				Field = "",
				Constructor = "",
				Enum = "󰕘",
				Interface = "",
				Function = "󰊕",
				Variable = "󰆧",
				Constant = "󰏿",
				String = "󰀬",
				Number = "󰎠",
				Boolean = "◩",
				Array = "󰅪",
				Object = "󰅩",
				Key = "󰌋",
				Null = "󰟢",
				EnumMember = "",
				Struct = "󰌗",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰊄",
			}

			-- Setup barbecue
			require("barbecue").setup({
				theme = {
					-- 		-- VS Code-like colors
					normal = { fg = "#a6a6c6" },
					-- 		separator = { fg = "#606060" },
					-- 		modified = { fg = "#FFCC00" },
					-- 		dirname = { fg = "#606060" },
					-- 		basename = { fg = "#9CDCFE", bold = true },
					-- 		context = { fg = "#9CDCFE" },
					-- 		context_function = { fg = "#DCDCAA" },
					-- 		context_method = { fg = "#DCDCAA" },
					-- 		context_property = { fg = "#9CDCFE" },
					-- 		context_variable = { fg = "#9CDCFE" },
				},
				-- 	symbols = {
				-- 		modified = "●",
				-- 		ellipsis = "...",
				-- 		separator = "",
				-- 	},
				-- 	kinds = kinds,
			})

			-- Enhanced document symbols function
			local function document_symbols()
				local opts = {
					symbols = {
						"Class",
						"Function",
						"Method",
						"Constructor",
						"Interface",
						"Module",
						"Struct",
						"Trait",
						"Field",
						"Property",
					},
					symbol_width = 40,
					symbol_fmt = function(symbol)
						local symbol_kind_icon = kinds[symbol.kind] or ""
						return string.format("%s %s", symbol_kind_icon, symbol.name)
					end,
				}
				require("telescope.builtin").lsp_document_symbols(opts)
			end

			-- Keymaps
			vim.keymap.set("n", "<leader>df", document_symbols, { noremap = true, silent = true })
		end,
	},
}
