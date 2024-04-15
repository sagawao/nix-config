local palette = require('solarized.palette')
local colors = palette.get_colors()

vim.o.background = 'light'
vim.wo.winhighlight = 'Normal:Normal'

vim.api.nvim_set_hl(0, 'NormalFloat', { fg = colors.base03 , bg = colors.base02 })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = colors.base01 })

vim.cmd.colorscheme = 'solarized'
