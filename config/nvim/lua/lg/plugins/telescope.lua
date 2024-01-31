return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    'nvim-telescope/telescope-file-browser.nvim'
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-p>"] = actions.move_selection_previous, -- move to prev result
            ["<C-n>"] = actions.move_selection_next,     -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', function() builtin.git_files() end, { desc = '[F]ind Git [f]iles' })
    vim.keymap.set('n', '<leader>faf', function() builtin.find_files({ no_ignore = true }) end,
      { desc = '[F]ind [A]ll [F]iles' })
    vim.keymap.set('n', '<leader>fh', function() builtin.help_tags() end, { desc = '[F]ind [H]elp' })
    vim.keymap.set('n', '<leader>fw', function() builtin.grep_string() end, { desc = '[F]ind current [W]ord' })
    vim.keymap.set('n', '<leader>fg', function() builtin.live_grep() end, { desc = '[F]ind by [G]rep' })
    vim.keymap.set('n', '<leader>fd', function() builtin.diagnostics() end, { desc = '[F]ind [D]iagnostics' })

    vim.keymap.set('n', '<leader>fag', function() require("telescope").extensions.live_grep_args.live_grep_args() end,
      { desc = '[F]ind [A]rgs [G]rep' })
    vim.keymap.set('n', '<leader>fe', function() require("telescope").extensions.file_browser.file_browser() end,
      { desc = '[F]ile [E]xplorer' })
    vim.keymap.set('n', '<leader>fce',
      function() require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" }) end,
      { desc = '[F]ile [C]wd [E]xplorer' })
  end,
}
