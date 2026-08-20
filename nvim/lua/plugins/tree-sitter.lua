return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter").setup()

        require("nvim-treesitter").install({
            "c", "lua", "vim", "vimdoc", "query", "terraform", "go", "rust", "yaml",
        })
    end,
}
