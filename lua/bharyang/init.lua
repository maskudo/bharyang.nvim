local function get_visual_lines()
  local vstart = vim.fn.getpos("'<")

  local vend = vim.fn.getpos("'>")

  local line_start = vstart[2]
  local line_end = vend[2]

  local lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)
  return lines
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
  local lines = sort_desc(get_visual_lines())
  for _, line in ipairs(lines) do
    print(line)
  end
  return lines
end

local function ascending()
  local lines = sort_asc(get_visual_lines())
  for _, line in ipairs(lines) do
    print(line)
  end
  return lines
end

return {
  asc = ascending,
  desc = descending,
}
