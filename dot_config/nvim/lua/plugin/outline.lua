vim.pack.add({ { src = "https://github.com/hedyhli/outline.nvim" } })

require("outline").setup({

	symbol_folding = {
		autofold_depth = false,
	},
	outline_window = {
		-- Where to open the split window: right/left
		position = "left",
		auto_close = true,
		auto_jump = true,
	},
	keymaps = {
		goto_location = "l",
		fold = "h",
		unfold = "<Cr>",
	},
})
vim.keymap.set("n", "<leader>v", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
