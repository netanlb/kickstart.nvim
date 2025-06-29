return {
  'jmbuhr/otter.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {},
  config = function()
    require('otter').setup {
      -- LSP behavior
      lsp = {
        -- update diagnostics on write (you can add InsertLeave or TextChanged for more live updates)
        diagnostic_update_events = { 'BufWritePost' },
        -- define root directory for embedded LSP servers like tsserver
        root_dir = function(_, bufnr)
          return vim.fs.root(bufnr or 0, {
            '.git',
            'package.json',
            'tsconfig.json',
          }) or vim.fn.getcwd(0)
        end,
      },

      -- Otter buffers behavior
      buffers = {
        set_filetype = true, -- ensures proper LSP + syntax
        write_to_disk = false, -- disable writing temp files to disk
        preambles = {}, -- not needed unless you want to auto-inject imports
        postambles = {},
        ignore_pattern = {
          python = '^(%s*[%%!].*)', -- good default, doesn't affect ts
        },
      },

      -- Strip these from start/end of code blocks
      strip_wrapping_quote_characters = { "'", '"', '`' },

      -- Maintain indentation info when creating otter buffers
      handle_leading_whitespace = true,

      -- Extensions for unknown filetypes (not needed for ts, already built-in)
      extensions = {},

      -- Debugging
      debug = false,
      verbose = {
        no_code_found = true, -- helpful warning if fenced blocks aren’t being detected
      },
    }

    -- optional: keymaps for LSP features in Markdown
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        -- Make sure otter activates and maps hover
        require('otter').activate({ 'typescript', 'javascript' }, true)

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
          buffer = true,
          desc = 'LSP Hover in fenced block (via otter)',
        })
      end,
    })
  end,
}
