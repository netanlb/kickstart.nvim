return {
  'tpope/vim-fugitive',
  cmd = { 'Git', 'Gdiffsplit', 'Gvdiffsplit', 'Gwrite', 'Gread', 'Glog', 'Gcommit', 'Gpush', 'Gpull' }, -- Lazy-load on command
  event = 'VeryLazy', -- Optional: Load on start for convenience
}
