local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "josean.plugins" }, { import = "josean.plugins.lsp" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	ui = {
		border = "single", -- Set the border style for the Lazy plugin manager (options: "single", "double", "none", etc.)
	},
})

vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "NONE", fg = "#c0caf5" }) -- Popup background and text color
vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#7aa2f7" }) -- Border color
