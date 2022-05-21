local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

local actions = require("telescope.actions")

-- Telescope
telescope.setup(
  {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<Tab>"] = "move_selection_previous",
          ["<S-Tab>"] = "move_selection_next",
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
      prompt_prefix = "  ",
      selection_caret = " ",
      entry_prefix = " ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          preview_width = 0.55,
          results_width = 0.8
        },
        vertical = {
          mirror = false,
        },
        width = 0.80,
        height = 0.85,
        preview_cutoff = 120
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = {"absolute"},
      winblend = 0,
      border = {},
      -- borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      color_devicons = true,
      use_less = true,
      set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    },
  }
)
telescope.load_extension('fzf')
telescope.load_extension('ui-select')

--Add leader shortcuts
vim.keymap.set("n", "<leader><space>", require('telescope.builtin').buffers)
vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
vim.keymap.set("n", "<leader>fb", require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
vim.keymap.set("n", "<leader>ft", require("telescope.builtin").tags)
vim.keymap.set("n", "<leader>fs", require("telescope.builtin").grep_string)
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>fo", function ()
  require('telescope.builtin').tags{ only_current_buffer = true }
end)
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles)
vim.keymap.set("n", "<leader>gt", require("telescope.builtin").git_status)

