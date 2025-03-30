--[[

-- # exit lua execution

do return end
os.exit()
-- https://stackoverflow.com/questions/20188458/how-to-exit-a-lua-scripts-execution

-- # print timestamp

print(os.time())
print(os.date())
vim.api.nvim_out_write(vim.fn.system({"date", "--iso-8601=ns"}))

--]]

----------------------------------------------------------------

vim.loader.enable()

----------------------------------------------------------------

local path_package = vim.fn.stdpath("data") .. "/site/"
local path_deps = path_package .. "pack/deps/start/mini.deps"
if not vim.uv.fs_stat(path_deps) then
	vim.system(
		{
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/echasnovski/mini.deps",
			path_deps,
		}
	):wait()
	vim.cmd("packadd mini.deps")
	vim.cmd("helptags ALL")
end

require("mini.deps").setup()

----------------------------------------------------------------

local original_require = require

----------------------------------------------------------------

-- # redefine `require` function

local require = function(modname)
	original_require("mini.deps").now(function()
		original_require(modname)
	end)
end

-- # effective before startup

require("vim_global_variable")

-- # library

require("_mini-extra")
require("_mini-icons")
require("_plenary")
require("_virtcol")

-- # ui stable

-- require("_eolmark")
-- require("_mini-starter")
-- require("_mini-tabline")
-- require("_mini-trailspace")
require("_buvvers")
require("_nofrils")
require("_outline_HACK1")
require("_whitespace")
require("option")
require("statusline")

----------------------------------------------------------------

-- # redefine `require` function

local require = function(modname)
	original_require("mini.deps").later(function()
		original_require(modname)
	end)
end

-- # main

-- require("_LuaSnip")
-- require("_NeoComposer")
-- require("_aerial")
-- require("_bufferline")
-- require("_gitsigns")
-- require("_harpoon")
-- require("_indent-blankline")
-- require("_lualine")
-- require("_mini-bracketed")
-- require("_mini-comment")
-- require("_mini-notify")
-- require("_mini-statusline")
-- require("_neo-tree")
-- require("_nvim-better-n")
-- require("_nvim-cmp")
-- require("_nvim-ghost")
-- require("_nvim-next")
-- require("_nvim-recorder")
-- require("_nvim-spider")
-- require("_nvim-surround")
-- require("_nvim-ufo")
-- require("_outline_HACK2")
-- require("_sidebar")
-- require("_sniprun")
-- require("_undotree-jiaoshijie")
-- require("_vim-ReplaceWithRegister")
-- require("_vim-suda")
-- require("_vuffers")
-- require("guicursor")
require("_Comment")
require("_auto-save")
require("_blink-cmp")
require("_conform")
require("_fidget")
require("_fzf-lua")
require("_go-up")
require("_guess-indent")
require("_lfsp")
require("_macro")
require("_markdown-preview")
require("_marks")
require("_mini-ai")
require("_mini-align")
require("_mini-bufremove")
require("_mini-deps")
require("_mini-diff")
require("_mini-indentscope")
require("_mini-move")
require("_mini-operators")
require("_mini-snippets")
require("_mini-splitjoin")
require("_mini-surround")
require("_modal_execution")
require("_nvim-colorizer")
require("_nvim-fundo")
require("_nvim-lspconfig")
require("_nvim-treesitter") -- slow
require("_nvim-treesitter-textobjects")
require("_outline")
require("_paramo")
require("_sentiment")
require("_tT")
require("_telescope")
require("_text-case")
require("_undotree-mbbill")
require("_vim-AdvancedSorters")
require("_vim-mark")
require("_vim-table-mode")
require("_yazi")
require("autocmd")
require("diagnostic")
require("keymap")
require("redir")
require("virtualedit")

-- # BufEnter

original_require("mini.deps").later(function()
	vim.api.nvim_exec_autocmds("BufEnter", {})
end)

----------------------------------------------------------------

local require = original_require

----------------------------------------------------------------

-- testing section

-- require("mini.deps").add({
-- 	source = "",
-- })
-- require("").setup({
-- })
