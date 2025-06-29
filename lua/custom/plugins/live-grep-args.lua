return {
  {
    -- 1. the extension itself
    'nvim-telescope/telescope-live-grep-args.nvim',
    version = '^1.0.0', -- lock a stable tag
    dependencies = { 'nvim-telescope/telescope.nvim' },
    -- 2. tell Telescope to load the extension
    config = function()
      require('telescope').load_extension 'live_grep_args'
    end,
  },
}
