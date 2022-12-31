local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    prompt_prefix = "$ ",
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- Disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- Use custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd('normal vbd')
          end
        },
        ["n"] = {
          -- Use custom normal mode mappings
          ["N"] = fb_actions.create, -- Create a new file
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extensions, after setup function:
telescope.load_extension("file_browser")

-- Key mappings
vim.keymap.set('n', ';?', builtin.oldfiles, { desc = '[?] Find recently opened files'})
vim.keymap.set('n', ';b', builtin.buffers, { desc = '[] Find existing buffers'})
vim.keymap.set('n', ';cb', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    windblend = 10,
    previewer = false
  })
end, { desc = '[cb] Fuzzily search in current buffer'})


vim.keymap.set('n', ';f', builtin.find_files, { desc = '[S]earch [F]iles'})
vim.keymap.set('n', ';h', builtin.help_tags, { desc = '[S]earch [H]elp'})
vim.keymap.set('n', ';w', builtin.grep_string, { desc = '[S]earch current [W]ord'})
vim.keymap.set('n', ';g', builtin.live_grep, { desc = '[S]earch by [G]rep'})
vim.keymap.set('n', ';d', builtin.diagnostics, { desc = '[S]earch [D]iagnostics'})

vim.keymap.set('n', 'sf', function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
