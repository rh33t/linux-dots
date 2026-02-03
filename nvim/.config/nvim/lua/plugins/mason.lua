return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "pyright",
      "black",
      "intelephense",
      "typescript-language-server",
      "tailwindcss-language-server",
      "gopls",
      "rust-analyzer",
    },
  },
}
