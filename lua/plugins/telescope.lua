return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- require('telescope').setup{
			--   defaults = {
			--     file_ignore_patterns = {
			--       "node_modules/",
			--       ".git/"
			--     }
			--   },
			-- }

			local builtin = require("telescope.builtin")
			-- local api = require('remote-sshfs.api')
			-- local connection = require('remote-sshfs.connections')
			--   vim.keymap.set('n', '<C-m>', function()
			--     if connection.is_connected then
			--       api.find_files()
			--     else
			--       builtin.find_files()
			--     end
			--   end, {})
			--   vim.keymap.set('n', '<C-g>', function()
			--     if connection.is_connected then
			--       api.live_grep()
			--     else
			--       builtin.live_grep()
			--     end
			--   end, {})
			vim.keymap.set("n", "<C-m>", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"junegunn/fzf",
		build = ":call fzf#install()",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
				},
			})
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("fzf")
		end,
	},
}
