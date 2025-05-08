require "nvchad.options"

local o = vim.o

o.relativenumber = true
o.jumpoptions = "view"

o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
