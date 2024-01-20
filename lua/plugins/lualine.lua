return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- function osExecute(cmd)
		-- 	local fileHandle = assert(io.popen(cmd, "r"))
		-- 	local commandOutput = assert(fileHandle:read("*a"))
		-- 	local result = string.match(commandOutput, ".*/(.*)")
		-- 	return result
		-- end
		function pyenv()
			local fileHandle = assert(io.popen("echo $CONDA_PREFIX", "r"))
			local commandOutput = assert(fileHandle:read("*a"))
			local result = string.match(commandOutput, ".*/([a-zA-Z0-9]*)")
			return result
		end

		require("lualine").setup({
			sections = {
				lualine_b = { "branch", "pyenv()" },
				lualine_c = { "buffers" },
				lualine_x = {},
				lualine_y = { "diff" },
				lualine_z = { "os.date('%H:%M')" },
			},
		})
	end,
}
