return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add to harpoon" })
		vim.keymap.set("n", "<leader>d", function()
			harpoon:list():remove()
		end, { desc = "Remove from harpoon" })
		-- vim.keymap.set("n", "<leader>h", function()
		-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end)
		for i = 1, 9 do
			vim.keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end, { desc = "Go to harpoon file " .. i })
		end

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end, { desc = "Go to previous harpoon file" })
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "Go to next harpoon file" })

		-- Use telescope picker
		local conf = require("telescope.config").values
		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local actions_state = require("telescope.actions.state")

		local function toggle_telescope(harpoon_files)
			local function make_finder()
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				return finders.new_table({
					results = file_paths,
				})
			end

			pickers
				.new({}, {
					prompt_title = "Harpoon",
					finder = make_finder(),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_bufnr, map)
						map("i", "<C-d>", function()
							local selected_entry = actions_state.get_selected_entry()
							local current_picker = actions_state.get_current_picker(prompt_bufnr)
							table.remove(harpoon_files.items, selected_entry.index)
							current_picker:refresh(make_finder(), { reset_prompt = false })
						end)
						return true
					end,
				})
				:find()
		end

		vim.keymap.set("n", "<leader>h", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
