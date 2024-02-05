local function get_visual_lines()
  local vstart = vim.fn.getpos("'<")

  local vend = vim.fn.getpos("'>")

  local line_start = vstart[2] - 1
  local line_end = vend[2]

  local lines = vim.api.nvim_buf_get_lines(0, line_start, line_end, false)
  return { line_start, line_end, lines }
end

local function sort_desc(lines)
  table.sort(lines, function(a, b)
    return #a > #b
  end)
  return lines
end

local function sort_asc(lines)
  table.sort(lines, function(a, b)
    return #a < #b
  end)
  return lines
end

local function descending()
  local line_start, line_end, lines = unpack(get_visual_lines())
  local sorted = sort_desc(lines)
  return { line_start, line_end, sorted }
end

local function ascending()
  local line_start, line_end, lines = unpack(get_visual_lines())
  local sorted = sort_asc(lines)
  return { line_start, line_end, sorted }
end

return {
  asc = ascending,
  desc = descending,
}
