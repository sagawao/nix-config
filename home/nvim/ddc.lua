vim.fn["ddc#custom#patch_global"]('ui', 'pum')
vim.fn["ddc#custom#patch_global"]('sources', {
	'around',
	'lsp',
	'skkeleton',
})
vim.fn["ddc#custom#patch_global"]('sourceOptions', {
    _ = {
        matchers = {'matcher_fuzzy'},
        sorters = {'sorter_fuzzy'},
        converters = {'converter_fuzzy'},
    },
    lsp = {
        mark = 'lsp',
        forceCompletionPattern = '\\.\\w*|:\\w*|->\\w*',
    },
    skkeleton = {
	mark = 'skkeleton',
	matchers = {},
	sorters = {},
	converters = {},
	isVolatile = true,
	minAutoCompleteLength = 1,
    },
})

vim.fn["ddc#enable"]()
vim.fn["signature_help#enable"]()
vim.fn["popup_preview#enable"]()

-- keymap
pum_insert_relative = vim.fn["pum#map#insert_relative"]
pum_select_relative = vim.fn["pum#map#select_relative"]
pum_confirm = vim.fn["pum#map#confirm"]
pum_cancel = vim.fn["pum#map#cancel"]

vim.keymap.set("i", "<C-y>", "<Cmd>lua pum_confirm()<CR>")
vim.keymap.set("i", "<C-n>", "<Cmd>lua pum_cancel()<CR>")

vim.keymap.set("i", "<Tab>", "<Cmd>lua pum_insert_relative(1)<CR>")
vim.keymap.set("i", "<S-Tab>", "<Cmd>lua pum_insert_relative(-1)<CR>")
vim.keymap.set("i", "<C-n>", "<Cmd>lua pum_select_relative(1)<CR>")
vim.keymap.set("i", "<C-p>", "<Cmd>lua pum_select_relative(-1)<CR>")

-- pum styling
vim.fn["pum#set_option"]({
    border = "rounded",
    padding = true,
    max_height = 10,
})

