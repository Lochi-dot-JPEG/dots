vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.spelllang = "en_au,en_us,en_gb"
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4
vim.opt.mouse = "a"
vim.opt.wrap = false
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- `:help 'list'`
-- `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"
-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Add packages
require("plugin.snacks")
vim.pack.add({
	{ src = "https://github.com/nvim-nreesitter/nvim-treesitter" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/folke/zen-mode.nvim" },
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.x"),
	},
	{ src = "https://github.com/ziontee113/color-picker.nvim" },
	{ src = "https://github.com/BurntSushi/ripgrep" },
	{ src = "https://github.com/seblyng/roslyn.nvim" },
	{ src = "https://github.com/sharkdp/fd" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/lambdalisue/vim-suda" },
	{ src = "https://github.com/preservim/vim-pencil" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

require("lspconfig")["tinymist"].setup({
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		semanticTokens = "disable",
	},
})

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
	ensure_installed = {
		"tinymist",
	},
})
require("color-picker").setup()
require("plugin.obsidian")
require("oil").setup({
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = true,
	},
	columns = {
		"permissions",
		"icon",
	},
	float = {
		max_width = 0.7,
		max_height = 0.6,
		border = "rounded",
	},
})

require("plugin.conform")
require("plugin.godot")
require("plugin.colorscheme")
require("blink.cmp").setup({
	keymap = {
		preset = "super-tab",
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	--enabled = function() return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype) end,
	completion = {
		documentation = { auto_show = false },
		trigger = { show_in_snippet = false },
	},
	sources = {
		--default = { "lsp", "path", "snippets", "buffer" },
		default = { "lsp", "path", "snippets" },
		--per_filetype = {
		--markdown = {},
		--},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

-- Markdown auto start pencil plugin
vim.api.nvim_create_augroup("pencil", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "pencil",
	pattern = { "typst", "markdown", "mkd" },
	callback = function()
		vim.fn["pencil#init"]({ wrap = "soft" })
		vim.opt_local.conceallevel = 2
	end,
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"rust",
		"c",
		"css",
		"html",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"vim",
		"vimdoc",
		"gdscript",
		"godot_resource",
		"gdshader",
	},
	auto_install = true,
	highlight = {
		enable = true,
		--disable = { "markdown" },
	},
})

-- --------------
-- Keybindings --
-- --------------

local map = vim.keymap.set

map("n", "<leader>w", ":update<cr>", { desc = "[W]rite", noremap = true, silent = true })
map("n", "<leader>W", ":SudaWrite<cr>", { desc = "[W]rite with sudo", noremap = true, silent = true })
map("n", "<leader>Q", ":quit<cr>", { desc = "[Q]uit" })
map("n", "<leader>ff", ":Oil<cr>", { desc = "[F]iles Oil" })
map({ "n", "v", "x" }, "<leader>fb", vim.lsp.buf.format, { desc = "Format buffer" })
map("n", "<C-c>", "<cmd>PickColor<cr>", opts)
map("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- Typst

require("typst-preview").setup({
	open_cmd = "qutebrowser %s --target tab",
})
map("n", "<leader>tp", ":TypstPreviewToggle<cr>", { desc = "[T]ypst [P]review", noremap = true, silent = true })
--map("n", "<leader>tp", ":TypstPreviewFollowCursor<cr>", { desc = "[T]ypst [P]review", noremap = true, silent = true })

-- TODO find a toggleterm alternative this is so bloated
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "curved",
	},
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
	-- function to run on closing the terminal
	on_close = function(term)
		vim.cmd("startinsert!")
	end,
})
function _lazygit_toggle()
	lazygit:toggle()
end

map("n", "<leader>h", "<cmd>lua _lazygit_toggle()<CR>", { desc = "Open Lazygit", noremap = true, silent = true })

vim.lsp.enable({
	"lua_ls",
	"tinymist",
	"rust_analyzer",
	"clangd",
	"gdscript",
	"markdownlint-cli2",
})
