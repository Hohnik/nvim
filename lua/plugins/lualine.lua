return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			sections = {
				lualine_b = { "branch" },
				lualine_c = { "buffers" },
				lualine_x = {},
				lualine_y = { "diff" },
				lualine_z = { "os.date('%H:%M')" },
			},
		})
	end,
}
