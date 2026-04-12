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

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.init")
require("config.options")
require("config.autocmds")
require("config.keymaps")

local plugins = {
	{ import = "plugins" },
	{ import = "colorschemes" },
}

local opts = {} -- your lazy configuration

require("lazy").setup(plugins, opts)

vim.api.nvim_command("colorscheme gruvbox")
--vim.api.nvim_command('colorscheme tokoyonight')
--vim.api.nvim_command('colorscheme catppuccin-macchiato')
