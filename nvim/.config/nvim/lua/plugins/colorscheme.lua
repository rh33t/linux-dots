return {
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        background = {
          dark = "macchiato",
        },
        integrations = {
          neotree = false
        }
      })
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  }
}
