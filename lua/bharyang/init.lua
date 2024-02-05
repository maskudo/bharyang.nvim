local lib = require("bharyang.lib")
local M = {}

M.BharyangAsc = function(_)
	local line_start, line_end, lines = unpack(lib.asc())
	vim.api.nvim_buf_set_lines(0, line_start, line_end, true, lines)
end

M.BharyangDesc = function(_)
	local line_start, line_end, lines = unpack(lib.desc())
	vim.api.nvim_buf_set_lines(0, line_start, line_end, true, lines)
end

M.BharyangGroup = function(_)
	local line_start, line_end, abs, rel, other = unpack(lib.group())
	local _, _, abs_sorted = unpack(lib.asc(abs))
	local _, _, rel_sorted = unpack(lib.asc(rel))
	local _, _, other_sorted = unpack(lib.asc(other))
	table.insert(abs_sorted, "\r")
	for _, line in ipairs(rel_sorted) do
		table.insert(abs_sorted, line)
	end
	table.insert(abs_sorted, "\r")
	for _, line in ipairs(other_sorted) do
		table.insert(abs_sorted, line)
	end
	vim.api.nvim_buf_set_lines(0, line_start, line_end, true, abs_sorted)
end

M.setup = function(_)
	vim.api.nvim_create_user_command("BharyangAsc", M.BharyangAsc, { range = true })
	vim.api.nvim_create_user_command("BharyangDesc", M.BharyangDesc, { range = true })
	vim.api.nvim_create_user_command("BharyangGroup", M.BharyangGroup, { range = true })
end

return M
