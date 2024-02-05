local at_pattern = "^%s*import%s*.-%s*from%s*'@/.-';%s*$"
local abs_pattern = "^%s*import%s*.-%s*from%s*'[^%.].-';%s*$"
local rel_pattern = "^%s*import%s*.-%s*from%s*'%.+.-';%s*$"

local function get_visual_lines()
	local vstart = vim.fn.getpos("'<")

	local vend = vim.fn.getpos("'>")

	local line_start = vstart[2] - 1
	local line_end = vend[2]

	local lines = vim.api.nvim_buf_get_lines(0, line_start, line_end, false)
	return { line_start, line_end, lines }
end

local function group_lines(lines)
	local at = {}
	local abs = {}
	local rel = {}
	local other = {}
	for _, line in ipairs(lines) do
		if line:match(at_pattern) then
			table.insert(at, line)
		elseif line:match(abs_pattern) then
			table.insert(abs, line)
		elseif line:match(rel_pattern) then
			table.insert(rel, line)
		else
			table.insert(other, line)
		end
	end
	return { abs, at, rel, other }
end

local function group()
	local line_start, line_end, lines = unpack(get_visual_lines())
	local at, abs, rel, other = group_lines(lines)
	return { line_start, line_end, at, abs, rel, other }
end

local sort = function(sort_fn, ls)
	local line_start, line_end, lines = unpack(get_visual_lines())
	if ls ~= nil then
		lines = ls
	end
	local sorted = sort_fn(lines)
	return { line_start, line_end, sorted }
end

local function sort_lines_desc(lines)
	table.sort(lines, function(a, b)
		return #a > #b
	end)
	return lines
end

local descending = function(ls)
	return sort(sort_lines_desc, ls)
end

local function sort_lines_asc(lines)
	table.sort(lines, function(a, b)
		return #a < #b
	end)
	return lines
end

local ascending = function(ls)
	return sort(sort_lines_asc, ls)
end

return {
	asc = ascending,
	desc = descending,
	group = group,
}
