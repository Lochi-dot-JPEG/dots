vim.pack.add({ "https://github.com/folke/snacks.nvim" })
require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	explorer = { enabled = true },
	indent = { enabled = false },
	input = { enabled = true },
	picker = {
		enabled = true,
		layout = {
			preset = "dropdown",
		},
		files = {
			hidden = true,
			ignored = false,
			exclude = { "**.uid", "**/*.*.uid" },
		},
		grep = {
			hidden = false,
			ignored = false,
			exclude = { "**.uid", "**/*.uid" },
		},
		explorer = {
			hidden = true,
			ignored = true,
			exclude = { "**.uid", "**/*.uid" },
		},
	},
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = false },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})

local map = vim.keymap.set
local picker = require("snacks.picker")

local source_opts = {

	exclude = { ".git" }
}

map("n", "<leader><space>", function() picker.smart() end, { desc = "Smart Find Files" })
map("n", "<leader>,", function() picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>:", function() picker.command_history() end, { desc = "Command History" })
map("n", "<leader>n", function() picker.notifications() end, { desc = "Notification History" })

-- find
--map("n", "<leader>ec",      ":e ~/.config/nvim/init.lua<cr>",{ desc = "Find Config File" })
map("n", "<leader>ec", function() picker.files({ cwd = "~/.config/nvim/" }) end, { desc = "Remove this command later" })
map("n", "<leader>sN", function() picker.files({ cwd = "~/.config/lazynvim/" }) end,
	{ desc = "Remove this command later, searches old config" })
map("n", "<leader>sn", function() picker.files({ cwd = "~/.local/share/chezmoi" }) end, { desc = "Find Config File" })
map("n", "<leader>so", function() picker.files({ cwd = "~/Brain" }) end, { desc = "Search Obsidian" })
map("n", "<leader>sf", function() picker.files() end, { desc = "Find Files" })
map("n", "<leader>sr", function() picker.recent() end, { desc = "Recent Files" })

-- Grep
map("n", "<leader>sg", function() picker.grep() end, { desc = "Grep" })

-- search
map("n", '<leader>s/', function() picker.search_history() end, { desc = "Search History" })
map("n", "<leader>q", function() picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>q", function() picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>sh", function() picker.help() end, { desc = "Help Pages" })
map("n", "<leader>i", function() picker.icons() end, { desc = "Icons" })
map("n", "<leader>sm", function() picker.man() end, { desc = "Man Pages" })
map("n", "<leader>sp", function() picker.lazy() end, { desc = "Search for Plugin Spec" })
map("n", "<leader>sq", function() picker.qflist() end, { desc = "Quickfix List" })
map("n", "<leader>s'", function() picker.resume() end, { desc = "Resume" })
map("n", "<leader>sc", function() picker.colorschemes() end, { desc = "Colorschemes" })

-- LSP
map("n", "gd", function() picker.lsp_definitions() end, { desc = "Goto Definition" })
map("n", "gD", function() picker.lsp_declarations() end, { desc = "Goto Declaration" })
map("n", "gr", function() picker.lsp_references() end, { desc = "References" })
map("n", "gI", function() picker.lsp_implementations() end, { desc = "Goto Implementation" })
map("n", "gy", function() picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
map("n", "<leader>ss", function() picker.lsp_symbols() end, { desc = "LSP Symbols" })
map("n", "<leader>sS", function() picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
