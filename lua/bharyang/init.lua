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

local BharyangGroup = function(sort_func)
	local line_start, line_end, groups = unpack(lib.group())
	local _, first = next(groups)
	local _, _, first_sorted = unpack(sort_func(first))
	for _, grp in ipairs({ unpack(groups, 2, #groups) }) do
		local _, _, grp_sorted = unpack(sort_func(grp))
		table.insert(first_sorted, "\r")
		for _, line in ipairs(grp_sorted) do
			table.insert(first_sorted, line)
		end
	end
	vim.api.nvim_buf_set_lines(0, line_start, line_end, true, first_sorted)
end

M.BharyangGroupDesc = function()
	return BharyangGroup(lib.desc)
end
M.BharyangGroupAsc = function()
	return BharyangGroup(lib.asc)
end

M.setup = function(_)
	vim.api.nvim_create_user_command("BharyangAsc", M.BharyangAsc, { range = true })
	vim.api.nvim_create_user_command("BharyangDesc", M.BharyangDesc, { range = true })
	vim.api.nvim_create_user_command("BharyangGroupAsc", M.BharyangGroupAsc, { range = true })
	vim.api.nvim_create_user_command("BharyangGroupDesc", M.BharyangGroupDesc, { range = true })
end

return M
