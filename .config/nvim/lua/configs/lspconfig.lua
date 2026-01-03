local capabilities = require("nvchad.configs.lspconfig").capabilities

vim.lsp.enable "clangd"
vim.lsp.enable "rust_analyzer"

-- Configure pyright
vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic", -- Can be "off", "basic", or "strict"
      },
    },
  },
}

-- Enable pyright
vim.lsp.enable "pyright"
