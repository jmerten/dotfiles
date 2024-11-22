---@class util
---@field mini util.mini
---@field ui util.ui
local M = {}

setmetatable(M, {
	__index = function(t, k)
		---@diagnostic disable-next-line: no-unknown
		t[k] = require("util." .. k)
		return t[k]
	end,
})

return M
