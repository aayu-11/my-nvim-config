return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
		{
			"hrsh7th/cmp-nvim-lsp",
			-- Pin to a specific version that works with Neovim 0.10.4
			version = "*",
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Alternative approach: Use a different completion trigger strategy
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				width = 60,
				height = 15,
				completion = {
					border = "rounded", -- Rounded corners for a polished look
					color = "NormalFloat", -- Background color for completion window
					side_padding = 1, -- Padding on the sides of the completion window
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder", -- Custom highlight
					scrolloff = 2, -- Padding to prevent sudden cutoff
				},
				documentation = {
					border = "rounded",
					color = "NormalFloat",
					side_padding = 1,
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					scrolloff = 2,
				},
				MiniColors = {
					border = "rounded",
					color = "NormalFloat",
					side_padding = 1,
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					scrolloff = 2,
				},
				shadow = false, -- Add a subtle shadow if available
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ 
					select = false,
					behavior = cmp.ConfirmBehavior.Replace,
				}),
				-- Safer completion trigger
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			-- sources for autocompletion - temporarily disable nvim_lsp to isolate issue
			sources = cmp.config.sources({
				-- { name = "nvim_lsp" }, -- Temporarily disabled to test
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			
			-- Simplified configuration to avoid compatibility issues

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
