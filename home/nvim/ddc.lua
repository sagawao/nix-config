vim.fn["ddc#custom#patch_global"]('ui', 'native')
vim.fn["ddc#custom#patch_global"]('sources', {'around', 'lsp'})
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
})

vim.fn["ddc#enable"]()
vim.fn["signature_help#enable"]()
vim.fn["popup_preview#enable"]()
