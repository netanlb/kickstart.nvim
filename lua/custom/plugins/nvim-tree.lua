return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require 'nvim-tree'

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    function toggle_git_ignored()
      local config = require('nvim-tree.config').get_module 'filters'
      config.git_ignored = not config.git_ignored -- Toggle git_ignored state
      nvimtree.refresh() -- Refresh tree to apply changes
    end

    nvimtree.setup {
      update_focused_file = {
        enable = true,
      },
      git = {
        ignore = false,
      },
      view = {
        width = 35,
        side = 'right',
        adaptive_size = true,
        mappings = {
          list = {
            { key = 'U', action_cb = 'toggle_git_ignored' }, -- Map 'u' to toggle git-ignored files
          },
        },
      },
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = '󰁕', -- Closed arrow icon (right-pointing)
              arrow_open = '󰁆',
            },
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
    }
    -- set keymaps
    local keymap = vim.keymap
    keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file location' })
    keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
    keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })
  end,
}
