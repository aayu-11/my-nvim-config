require("josean.core.options")
require("josean.core.keymaps")
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.wo.number = false
		vim.wo.relativenumber = false
	end,
})
vim.opt.cmdheight = 0
