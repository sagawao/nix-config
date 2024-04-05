vim.fn["ddu#custom#patch_global"]({
    ui = 'ff',
    sourceOptions = {
        _ = {
            matchers = {'matcher_substring'}
        }
    }
})

vim.fn["ddu#custom#patch_local"]('node-files', {
      sources = {'file_rec'},
      sourceParams = {
        file_rec = {
            ignoredDirectories = {'.git', 'node_modules'}
        }
    }
})

vim.fn["ddu#custom#patch_local"]('whole-files', {
    sources = {'file_rec'},
    sourceParams = {
        file_rec = {
            ignoredDirectories = {}
        }
    },
    sourceOptions = {
        file_rec = {
            maxItems = 50000
        }
    }
})

-- add auto command on ddu-ui

local autoCmd = vim.api.nvim_create_autocmd

autoCmd('FileType', {
    pattern = "ddu-ff",
    callback = function()
        vim.api.nvim_buf_set_keymap(
	  0, "n", "e",
	  "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open'})<CR>",
	  {noremap = true}
	)
    end
})

-- add command

local addCmd = vim.api.nvim_create_user_command

addCmd('DduNodeFiles', function()
    vim.fn["ddu#start"]({
        name = 'node-files',
        sourceOptions = {
            file_rec = {
                path = vim.fn.getcwd()
            }
        }
    })
end, {})

addCmd('DduWholeFiles', function()
    vim.fn["ddu#start"]({
        name = 'whole-files',
	sourceOptions = {
            file_rec = {
              path = vim.fn.getcwd()
	    }
	}
    })
end, {})
