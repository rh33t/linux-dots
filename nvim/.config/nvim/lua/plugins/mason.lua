return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      "black",
      "intelephense",
      "typescript-language-server",
      "tailwindcss-language-server",
      "gopls",
      "stimulus-language-server",
      "css-lsp",
      "rust-analyzer",
    },
  },
}
