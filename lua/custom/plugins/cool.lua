return {
  { "shellRaining/hlchunk.nvim",config = function ()
    require('hlchunk').setup({
      indent = {
        enable = false,
      },
      blank = {
        enable = false,
      }
    })
  end
  },
  {
    "rareitems/printer.nvim", config = function ()
      local function webPrint(_, b)
        return string.format('console.log({%s})', b)
      end
      require('printer').setup({
        keymap = "gp",
        add_to_inside = function(text)
          return ""
        end,
        formatters = {
          typescript = webPrint,
          javascript = webPrint,
          vue = webPrint,
          html = webPrint,
        },
      })
    end
    ,
  }
}
