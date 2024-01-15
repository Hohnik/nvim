return {
	"nvimtools/none-ls.nvim",
	dependencies = "lukas-reineke/lsp-format.nvim",
	config = function()
		require("lsp-format").setup({})
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.diagnostics.pylint,
			},
			debug = false,
			on_attach = require("lsp-format").on_attach,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
