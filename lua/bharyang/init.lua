local function get_visual_lines()
  local vstart = vim.fn.getpos("'<")

  local vend = vim.fn.getpos("'>")

  local line_start = vstart[2]
  local line_end = vend[2]

  local lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)
  return lines
end

return {
  get_visual_lines = get_visual_lines,
}
