vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		--python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		--javascript = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd" },
		javascript = { "prettierd" },
		typ = { "prettypst" },
		cs = { "lsp" },

		html = function(bufnr)
			local name = vim.api.nvim_buf_get_name(bufnr)

			if name:match("%.njk$") then
				return { "djlint" }
			end

			return { "prettierd" }
		end,
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
})

vim.keymap.set("n", "<leader>ft", function()
	require("conform").format({ formatters = { "csharpier" } })
	if vim.g.disable_autoformat then
		vim.g.disable_autoformat = false
	else
		vim.g.disable_autoformat = true
	end
end, { desc = "[F]ormatting [T]oggle", noremap = true, silent = true })

vim.keymap.set("n", "<leader>fc", function()
	require("conform").format({ formatters = { "csharpier" } })
end, { desc = "[F]ormatting [C]sharpier", noremap = true, silent = true })

vim.filetype.add({
	extension = {
		njk = "html",
	},
})

-- Create user commands to quickly enable/disable autoformatting
require("conform").setup({
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})


vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
