return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require "configs.conform"
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },

    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- lua
                "lua-language-server",
                "stylua",
                -- python
                "isort",
                "pyright",
                "ruff",
                -- csharp
                "omnisharp",
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "sql",
                "scala",
                "python",
                "c_sharp",
            },
        },
    },

    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require "configs.dashboard"
        end,
        dependencies = { { "nvim-tree/nvim-web-devicons" } },
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "tpope/vim-fugitive",
        cmd = "Git",
        lazy = false,
    }, {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        {
            "rcarriga/nvim-notify",
            opts = {
                top_down = false,
            },
            init = function()
                local banned_messages = {
                    "No information available",
                }
                vim.notify = function(msg, ...)
                    for _, banned in ipairs(banned_messages) do
                        if msg == banned then
                            return
                        end
                    end
                    return require "notify" (msg, ...)
                end
            end,
        },
    },
    config = function()
        require "configs.noice"
        ---@diagnostic disable-next-line: different-requires
        vim.lsp.handlers["textDocument/hover"] = require("noice").hover
        ---@diagnostic disable-next-line: different-requires
        vim.lsp.handlers["textDocument/signatureHelp"] = require("noice").signature
    end,
},
    { "dense-analysis/ale" },
}
