return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        integrations = {
          mason = true,
          treesitter = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          illuminate = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
