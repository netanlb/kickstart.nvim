return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- latest
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      ui = {
        enabled = true,
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
          ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
          ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
          ['!'] = { char = '', hl_group = 'ObsidianImportant' },
          ['i'] = { char = '󰋼', hl_group = 'ObsidianInfo' },
        },
      },
      workspaces = {
        {
          name = 'notes',
          path = '~/notes', -- path to your Obsidian vault
        },
      },
      completion = {
        nvim_cmp = true, -- optional, enable if you're using nvim-cmp
      },
      mappings = {
        ['gd'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      },
      note_id_func = function(title)
        -- Use title as filename, fallback to date if no title is given
        if title ~= nil then
          return title:gsub(' ', ' '):gsub('[^A-Za-z0-9- ]', ''):gsub(' ', '-'):lower()
        else
          return tostring(os.time())
        end
      end,
    },
    config = function(_, opts)
      require('obsidian').setup(opts)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.opt_local.conceallevel = 2
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.breakindent = true
          vim.opt_local.showbreak = '↪ '
          vim.keymap.set('n', 'j', 'gj', { buffer = true })
          vim.keymap.set('n', 'k', 'gk', { buffer = true })
        end,
      })
    end,
  },
}
