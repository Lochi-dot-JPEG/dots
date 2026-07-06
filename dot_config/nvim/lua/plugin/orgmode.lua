vim.pack.add({
	{ src = "https://github.com/nvim-orgmode/orgmode" },
	{ src = "https://github.com/chipsenkbeil/org-roam.nvim" },
})
require("orgmode").setup({
	org_agenda_files = "~/orgfiles/**/*",
	org_default_notes_file = "~/orgfiles/refile.org",
})
-- Experimental LSP support
vim.lsp.enable("org")

require("org-roam").setup({
	directory = "~/orgfiles/roam/",
	-- optional
	org_files = {
		"~/orgfiles",
	},
})
