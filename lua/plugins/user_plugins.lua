return
{
        { "lambdalisue/vim-suda" },
        {
                "NeogitOrg/neogit",
                dependencies = {
                        "nvim-lua/plenary.nvim",         -- required
                        "sindrets/diffview.nvim",        -- optional - Diff integration

                        -- Only one of these is needed.
                        "nvim-telescope/telescope.nvim", -- optional
                        "ibhagwan/fzf-lua",              -- optional
                        "echasnovski/mini.pick",         -- optional
                },
                config = true
        },
        {
                "rbong/vim-flog",
                lazy = true,
                cmd = { "Flog", "Flogsplit", "Floggit" },
                dependencies = {
                        "tpope/vim-fugitive",
                },
        },
}
