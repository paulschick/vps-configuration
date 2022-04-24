local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print("Unable to configure TreeSitter")
	return
end

configs.setup({
	--ensure_installed = "maintained",
    ensure_installed = {
        "lua",
        "rust",
        "go",
        "python",
        "javascript",
        "typescript",
        "bash",
        "css",
        "html",
        "jsdoc",
        "json",
        "markdown",
        "vim",
        "yaml"
    },
	sync_install = false,
	ignore_install = { "" },
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "" }, -- list of languages to disable for
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
})