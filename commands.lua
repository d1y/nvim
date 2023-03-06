local create = vim.api.nvim_create_user_command

-- use ~/.zshrc function :)
-- T ()
-- {
--   tmux rename-window $1
-- }
create("T", function (args)
  local input = tostring(args.args)
  local cmd = string.format('tmux rename-window %s > /dev/null 2>&1 &', input)
  os.execute(cmd)
end, {
  nargs = "*",
})

-- auto-wide neotree
-- local function is_neotree_open()
-- 	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
-- 		if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'ft') == 'neo-tree' then
--       -- FIXME: dynamic get offset(neo-tree width)
--       local offset = 35
-- 			return require 'bufferline.api'.set_offset(offset, "=͟͟͞͞=͟͟͞͞(●⁰ꈊ⁰● |||)")
-- 		end
-- 	end
-- 	return require 'bufferline.api'.set_offset(0)
-- end
--
-- vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufWipeout' }, {
-- 	pattern = '*',
-- 	callback = function()
-- 		is_neotree_open()
-- 	end
-- })
