return {
  -- color html colors
  { 'norcalli/nvim-colorizer.lua', config = function()
    require 'colorizer'.setup {
      css = { css_fn = true, css = true },
      'vue',
      'javascript',
      'html',
      'r',
      'rmd',
      'qmd',
      'markdown',
      'python'
    }
    end
  },
}