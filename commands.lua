local create = vim.api.nvim_create_user_command

create("T", function (args)
  local input = tostring(args.args)
  local cmd = string.format('tmux rename-window %s > /dev/null 2>&1 &', input)
  os.execute(cmd)
end, {
  nargs = "*",
})
