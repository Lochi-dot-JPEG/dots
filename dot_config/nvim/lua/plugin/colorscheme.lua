vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/thesimonho/kanagawa-paper.nvim" },
	{ src = "https://github.com/sainnhe/gruvbox-material" },
})

vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_transparent_background = 0

--vim.g.gruvbox_material_colors_override = { bg0 = { "#0000", 0 }, bg2 = { "#282828", 235 } }
--vim.g.gruvbox_material_colors_override = { 'bg0': ['#00000000', '234']}
vim.cmd([[colorscheme gruvbox-material]])
