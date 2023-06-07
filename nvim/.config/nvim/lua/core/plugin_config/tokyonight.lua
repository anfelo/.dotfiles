require("tokyonight").setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = false, -- Enable this to disable setting the background color
})

vim.o.termguicolors = true
vim.cmd [[ colorscheme tokyonight ]]
