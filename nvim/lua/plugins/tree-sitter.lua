return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.config").setup({
			--ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "terraform", "go", "rust", "yaml" },
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
		})
		-- Replacing ensure_installed functionality
		local ensureInstalled = { "lua", "vim", "vimdoc", "query", "terraform", "go", "rust", "yaml" }
		local alreadyInstalled = require("nvim-treesitter.config").get_installed()
		local parsersToInstall = vim.iter(ensureInstalled)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		require("nvim-treesitter").install(parsersToInstall)
	end,
}
