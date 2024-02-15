return {
  "nvimtools/none-ls.nvim",
  dependencies = "lukas-reineke/lsp-format.nvim",

  config = function()
    require("lsp-format").setup({})
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    null_ls.setup({
      debug = false,

      sources = {
        null_ls.builtins.diagnostics.pylint.with({
          method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
          diagnostic_config = {
            -- see :help vim.diagnostic.config()
            underline = true,
            signs = { severity = vim.diagnostic.severity.WARN },
            virtual_text = { severity = vim.diagnostic.severity.WARN },
            update_in_insert = false,
            severity_sort = true,
          },
          diagnostics_postprocess = function(diagnostic)
            diagnostic.code = diagnostic.message_id
          end,
        }),
        null_ls.builtins.diagnostics.eslint,

        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
      },

      on_attach = function(client, bufnr)
        -- require("lsp-format").on_attach
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
              -- vim.lsp.buf.formatting_sync()
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
