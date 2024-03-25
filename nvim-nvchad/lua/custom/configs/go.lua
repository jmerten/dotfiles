local options = {
	notify = false,
	formatter = "lsp",
	auto_format = false,
	auto_lint = false,
	lint_prompt_style = "vt",
	-- testing
	test_flags = {
		"-cover",
		"-race",
		"-v",
	},
	test_popup_auto_leave = true,
}

require("go").setup(options)
