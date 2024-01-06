return {
	"nvim-treesitter/nvim-treesitter",
	config= function()
    require("nvim-treesitter.configs").setup({
      build = ":TSUpdate",
      --ensure_installed = { "python", "lua", "vim", "javascript", "html", "java" },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true, additional_vim_regex_highlighting = true },
      indent = { enable = true }
    })
  end,
}
