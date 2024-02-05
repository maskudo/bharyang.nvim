local lib = require("bharyang.lib")
local M = {}

M.BharyangAsc = function(args)
  local line_start, line_end, lines = unpack(lib.asc())
  vim.api.nvim_buf_set_lines(0, line_start, line_end, true, lines)
end

M.BharyangDesc = function(args)
  local line_start, line_end, lines = unpack(lib.desc())
  vim.api.nvim_buf_set_lines(0, line_start, line_end, true, lines)
end

M.setup = function(_)
  vim.api.nvim_create_user_command("BharyangAsc", M.BharyangAsc, { range = true })
  vim.api.nvim_create_user_command("BharyangDesc", M.BharyangDesc, { range = true })
end

return M
