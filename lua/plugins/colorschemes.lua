return {
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  -- Replace LazyVim colorscheme to retrobox:
  { "LazyVim/LazyVim", opts = { colorscheme = "retrobox" } },
}
