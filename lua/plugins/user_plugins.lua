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
                {
                        "folke/trouble.nvim",
                        opts = {}, -- for default options, refer to the configuration section for custom setup.
                        cmd = "Trouble",
                        keys = {
                                {
                                        "<leader>xx",
                                        "<cmd>Trouble diagnostics toggle<cr>",
                                        desc = "Diagnostics (Trouble)",
                                },
                                {
                                        "<leader>xX",
                                        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                                        desc = "Buffer Diagnostics (Trouble)",
                                },
                                {
                                        "<leader>cs",
                                        "<cmd>Trouble symbols toggle focus=false<cr>",
                                        desc = "Symbols (Trouble)",
                                },
                                {
                                        "<leader>cl",
                                        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                                        desc = "LSP Definitions / references / ... (Trouble)",
                                },
                                {
                                        "<leader>xL",
                                        "<cmd>Trouble loclist toggle<cr>",
                                        desc = "Location List (Trouble)",
                                },
                                {
                                        "<leader>xQ",
                                        "<cmd>Trouble qflist toggle<cr>",
                                        desc = "Quickfix List (Trouble)",
                                },
                        },
                },
                {
                        "vhyrro/luarocks.nvim",
                        priority = 1001, -- this plugin needs to run before anything else
                        hererocks = true,
                        opts = {
                                rocks = { "magick" },
                        },
                },
                {
                        "3rd/image.nvim",
                        dependencies = { "luarocks.nvim" },
                        config = function()
                                -- ...
                        end
                },
                {
	                "chrisgrieser/nvim-scissors",
	                dependencies = "nvim-telescope/telescope.nvim",
	                opts = {
		                snippetDir = "/home/huseyin/.local/share/nvim/lazy/friendly-snippets/snippets",
	                }
                },
        }
