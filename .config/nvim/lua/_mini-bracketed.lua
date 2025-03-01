require("mini.deps").add({
	source = "echasnovski/mini.bracketed",
})

require("mini.bracketed").setup({
	buffer     = { suffix = "<tab>", options = {} },
	comment    = { suffix = "c",     options = {} },
	conflict   = { suffix = "x",     options = {} },
	diagnostic = { suffix = "d",     options = {} },
	file       = { suffix = "f",     options = {} },
	indent     = { suffix = "i",     options = {} },
	jump       = { suffix = "g",     options = {} },
	location   = { suffix = "a",     options = {} },
	oldfile    = { suffix = "o",     options = {} },
	quickfix   = { suffix = "",      options = {} },
	treesitter = { suffix = "t",     options = {} },
	undo       = { suffix = "",      options = {} },
	window     = { suffix = "w",     options = {} },
	yank       = { suffix = "y",     options = {} },
})

for _, i in pairs(require("mini.bracketed").config) do
	i.suffix_strip = i.suffix:match("^<(.-)>$") or i.suffix
	vim.keymap.set("n", string.format("<a-%s>",   i.suffix_strip), string.format("]%s", i.suffix), {remap = true})
	vim.keymap.set("n", string.format("<a-s-%s>", i.suffix_strip), string.format("[%s", i.suffix), {remap = true})
end
