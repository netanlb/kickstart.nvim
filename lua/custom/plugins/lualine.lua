return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    -- local lazy_status = require 'lazy.status' -- to configure lazy pending updates count
    lualine.setup {
      options = {
        theme = 'kanagawa',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        icons_enabled = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'branch', icon = '' }, 'diff' },
        lualine_c = { 'progress', 'location', 'diagnostics' },

        lualine_x = { 'encoding', 'fileformat' }, -- Removed filetype
        -- lualine_x = {},
        lualine_y = {
          {
            function()
              local filename = vim.fn.expand '%:t' -- Get the filename
              local extension = vim.fn.expand '%:e' -- Get the file extension
              local icon = require('nvim-web-devicons').get_icon(filename, extension, { default = true }) -- Get icon
              return icon .. ' ' .. filename -- Combine icon and filename
            end,
            cond = function()
              return vim.fn.expand '%:t' ~= '' -- Show only if a file is open
            end,
          },
        },
        lualine_z = {
          {
            function()
              local path = vim.fn.expand '%:h'
              return vim.fn.fnamemodify(path, ':t')
            end,
            icon = '',
          },
        },
      },
    }

    -- local colors = {
    --   blue = '#65D1FF',
    --   green = '#3EFFDC',
    --   violet = '#FF61EF',
    --   yellow = '#FFDA7B',
    --   red = '#FF4A4A',
    --   fg = '#c3ccdc',
    --   bg = '#112638',
    --   inactive_bg = '#2c3043',
    -- }
    --
    -- local my_lualine_theme = {
    --   normal = {
    --     a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   insert = {
    --     a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   visual = {
    --     a = { bg = colors.violet, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   command = {
    --     a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   replace = {
    --     a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
    --     b = { bg = colors.bg, fg = colors.fg },
    --     c = { bg = colors.bg, fg = colors.fg },
    --   },
    --   inactive = {
    --     a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
    --     b = { bg = colors.inactive_bg, fg = colors.semilightgray },
    --     c = { bg = colors.inactive_bg, fg = colors.semilightgray },
    --   },
    -- }
    --
    -- -- configure lualine with modified theme
    -- lualine.setup {
    --   options = {
    --     theme = my_lualine_theme,
    --   },
    --   sections = {
    --     lualine_x = {
    --       {
    --         lazy_status.updates,
    --         cond = lazy_status.has_updates,
    --         color = { fg = '#ff9e64' },
    --       },
    --       { 'encoding' },
    --       { 'fileformat' },
    --       { 'filetype' },
    --     },
    --   },
    -- }
  end,
}
