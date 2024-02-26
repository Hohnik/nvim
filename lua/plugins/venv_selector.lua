return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  -- event = "VeryLazy",
  opts = {
    auto_refresh = true,
    -- name = { "envs", "venv", ".venv", "pong" },
    parents = 1,
    path = "/Users/niklas/miniforge3/envs",
    anaconda_base_path = "/Users/niklas/miniforge3",
    anaconda_envs_path = "/Users/niklas/miniforge3/envs",
  },

  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
    { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
  },

  config = function()
    require("venv-selector").setup({
      change_venv_hooks = {
        require("venv-selector").hooks.pyright,
      },
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      desc = "Auto select virtualenv Nvim open",
      pattern = "*",
      callback = function()
        local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
        if venv ~= "" then
          require("venv-selector").retrieve_from_cache()
        end
      end,
      once = true,
    })
  end,
}
