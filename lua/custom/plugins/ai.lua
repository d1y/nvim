return {
  { "Exafunction/codeium.vim", 
    config = function ()
      -- https://github.com/Exafunction/codeium.vim
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set('i', '<M-Bslash>', function () return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<M-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<M-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('n', '<M-c>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  , }
}
