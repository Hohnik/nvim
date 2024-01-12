return {
	'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
    require("oil").setup({
      keymaps = {
        ["l"] = "actions.select",
        ["h"] = "actions.parent",
      },
    })
    vim.keymap.set("n", "<C-p>", "<CMD>Oil<CR>", {})
  end,
}
