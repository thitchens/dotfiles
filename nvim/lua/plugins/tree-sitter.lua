return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "terraform", "go", "rust", "yaml" },
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
		})
	end,
}
