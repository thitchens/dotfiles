return {
    "ray-x/go.nvim",
    dependencies = {
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
        "akinsho/toggleterm.nvim",
    },
    config = function()
        require("go").setup({
            lsp_codelens = false,
        })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    keys = {
        { "<leader>of", "<cmd>GoFillStruct<cr>",            desc = ":GoFillStruct" },
        { "<leader>ot", "<cmd>GoModTidy<cr>",               desc = ":GoModTidy" },
        { "<leader>or", '<cmd>TermExec cmd="go run ."<cr>', desc = "go run terminal" },
        { "<leader>oa", "<cmd>GoAddTag<cr>",                desc = ":GoAddTag" },
    },
}
