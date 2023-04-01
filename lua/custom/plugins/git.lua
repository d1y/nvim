return {
  { 'sindrets/diffview.nvim' },
  { 'TimUntersberger/neogit',
    lazy = true,
    cmd = 'Neogit',
    config = function()
      require('neogit').setup {
        disable_commit_confirmation = true,
        integrations = {
          diffview = true
        }
      }
    end
  },
  { 'akinsho/git-conflict.nvim', config = function()
    require('git-conflict').setup {
      default_mappings = true,
      disable_diagnostics = true,
    }
  end
  },
  { 'f-person/git-blame.nvim' },
}
