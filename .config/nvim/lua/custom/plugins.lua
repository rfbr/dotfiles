local cmp = require "cmp"

local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-neotest/nvim-nio" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    lazy = false,
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- python
        "pyright",
        "black",
        "mypy",
        "pylint",
        "isort",
        -- cpp
        "clangd",
        "clang-format",
        "codelldb",
        -- js/ts
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
        -- rust
        "rust-analyzer",
      }
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    event= "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "git")
      require("gitsigns").setup(opts)
      require "custom.configs.gitsigns"
    end,
  },
  {
    "hkupty/iron.nvim",
    ft = {"python"},
    config = function()
      require "custom.configs.ironconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end
  },
  {
    "scalameta/nvim-metals",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "scala", "sbt", "java" },
    -- stylua: ignore
    keys = {
      {'<leader>me', function() require "telescope".extensions.metals.commands() end, desc="Metals commands"},
      {'<leader>mc', function() require "metals".compile_cascade() end, desc="Metals compile cascade"},
      {'<leader>mw', function() vim.lsp.buf.add_workspace_folder() end, desc="Metals add workspace"},
      {'<leader>gd', function() vim.lsp.buf.definition() end, desc="Metals goto definition"},
      {'<leader>ls', function() vim.lsp.buf.signature_help() end, desc="Metals signature help"},
      {'<leader>ra', function() require("nvchad.renamer").open() end, desc="Metals LSP rename"},
      {'<leader>gr', function() vim.lsp.buf.references()  end, desc="Metals references"},
      {'<leader>lf',
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Metals Floating diagnostic",
      },
      {"[d",
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
      },

      {"]d",
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },
    {"<leader>q",
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },
    {"<leader>ws",
      function()
        require("metals").hover_worksheet()
      end, "Metals worksheet hover"}
    },
    config = function()
      local metals = require("metals")
      local config = metals.bare_config()

      config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
        serverProperties = { "-Xmx2g" },
        serverVersion = "latest.snapshot",
        enableSemanticHighlighting = false,
      }

      config.init_options.statusBarProvider = "on"

      -- cmp integration
      config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      local dap = require("dap")
      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
          },
        },
      }
      dap.listeners.after["event_terminated"]["nvim-metals"] = function()
        -- vim.notify("Tests have finished!")
        dap.repl.open()
      end

      config.on_attach = function(client, bufnr)
        metals.setup_dap()
        require("lsp-format").on_attach(client, bufnr)
      end

      -- Autocmd that will actually be in charge of starting the whole thing
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          metals.initialize_or_attach(config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}
return plugins
