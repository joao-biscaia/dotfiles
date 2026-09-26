-- Ported from the old after/plugin/colors.lua: rose-pine with a transparent background
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = { transparency = true },
    },
  },

  -- tell LazyVim to use rose-pine instead of tokyonight
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
