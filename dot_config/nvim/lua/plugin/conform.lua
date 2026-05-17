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

vim.keymap.set("n", "<leader>fc", function()
	require("conform").format({ formatters = { "csharpier" } })
end)

vim.filetype.add({
	extension = {
		njk = "html",
	},
})
