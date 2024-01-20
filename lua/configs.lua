vim.g.mapleader = " "

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set undofile")
vim.cmd("set nohlsearch")
vim.cmd("set incsearch")
vim.cmd("set columns=100")
vim.cmd("set cursorline")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.cmd("set nofoldenable")

vim.keymap.set("i", "jk", "<Esc>", {})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})
vim.keymap.set("n", "<leader>j", ":bN<CR>", {})
vim.keymap.set("n", "<leader>k", ":bn<CR>", {})

vim.diagnostic.config({ virtual_text = { severity = vim.diagnostic.severity.ERROR } })

--vim.api.nvim_create_autocmd()

local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"qf",
		"man",
		"help",
		"query",
		"notify",
		"lspinfo",
		"startuptime",
		"checkhealth",
		"tsplayground",
		"spectre_panel",
		"neotest-output",
		"neotest-summary",
		"PlenaryTestPopup",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
