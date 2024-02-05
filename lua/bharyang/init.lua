local lib = require("bharyang.lib")

function BharyangAsc()
  local line_start, line_end, lines = unpack(lib.asc())
  vim.api.nvim_buf_set_lines(0, line_start, line_end, true, lines)
end

function BharyangDesc()
  local line_start, line_end, lines = unpack(lib.desc())
  vim.api.nvim_buf_set_lines(0, line_start, line_end, true, lines)
end

return {
  BharyangAsc = BharyangAsc,
  BharyangDesc = BharyangDesc,
}
