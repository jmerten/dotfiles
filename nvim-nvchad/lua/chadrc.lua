-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@class ChadrcConfig
local M = {}

M.ui = {
	theme = "gruvchad",

	hl_override = {
		-- 	Comment = { italic = true },
		-- 	["@comment"] = { italic = true },
		Normal = { bg = "none" },
		NormalFloat = { bg = "none" },

		-- cmp highlighting
		CmpItemAbbrDeprecated = { bg = "NONE", strikethrough = true, fg = "#808080" },
		CmpItemAbbrMatch = { bg = "NONE", fg = "#569CD6" },
		CmpItemAbbrMatchFuzzy = { link = "CmpIntemAbbrMatch" },
		CmpItemKindVariable = { bg = "NONE", fg = "#9CDCFE" },
		CmpItemKindInterface = { link = "CmpItemKindVariable" },
		CmpItemKindMethod = { link = "CmpItemKindFunction" },
		CmpItemKindUnit = { link = "CmpItemKindKeyword" },

		-- Pmenu customizations
		PmenuSel = { bg = "#282C34", fg = "NONE" },
		Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

		CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },

		CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
		CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
		CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

		CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
		CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
		CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },

		CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
		CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
		CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

		CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
		CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
		CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
		CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
		CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

		CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

		CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
		CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

		CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
		CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

		CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
		CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
	},
}

return M
