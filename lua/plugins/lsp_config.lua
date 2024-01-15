return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "html", "cssls", "eslint", "jdtls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.eslint.setup({ capabilities = capabilities })

			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

			vim.keymap.set("n", "<leader>r", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>e", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>grr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
		end,
	},
}
