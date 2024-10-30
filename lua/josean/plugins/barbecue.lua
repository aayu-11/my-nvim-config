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

			require("barbecue").setup({
				theme = {
					normal = { fg = "#a6a6c6" },
				},
			})

			local navic = require("nvim-navic")
			navic.setup({
				icons = kinds,
				highlight = true,
				separator = " > ",
				depth_limit = 0,
				depth_limit_indicator = "..",
				click = false,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client.server_capabilities.documentSymbolProvider then
						navic.attach(client, args.buf)
					end
				end,
			})

			local function create_symbols_popup(symbols_filter)
				local win_width = vim.api.nvim_win_get_width(0)
				local saved_cursor = vim.fn.getcurpos()
				vim.api.nvim_win_set_cursor(0, { 2, win_width - 1 })

				local opts = {
					symbols = symbols_filter,
					symbol_width = 40,
					symbol_fmt = function(symbol)
						local symbol_kind_icon = kinds[symbol.kind] or ""
						return string.format("%s %s", symbol_kind_icon, symbol.name)
					end,
					layout_config = {
						cursor = {
							width = 0.5,
							height = 0.4,
							preview_cutoff = 1,
						},
					},
					layout_strategy = "cursor",
					sorting_strategy = "ascending",
					results_title = false,
					prompt_title = false,
					borderchars = {
						prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					},
					mappings = {
						i = {
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
							["<CR>"] = "select",
							["<C-c>"] = "close",
							["<Esc>"] = "close",
						},
					},
				}

				require("telescope.builtin").lsp_document_symbols(opts)
				vim.fn.setpos(".", saved_cursor)
			end

			local function document_functions()
				create_symbols_popup({
					"Function",
					"Class",
					"Method",
					"Constructor",
					"Object",
					"ArrowFunction",
				})
			end

			-- Keymap for df functionality
			vim.keymap.set(
				"n",
				"<leader>df",
				document_functions,
				{ noremap = true, silent = true, desc = "Document functions" }
			)
		end,
	},
}
