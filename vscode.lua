vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true

vim.keymap.set({ "n", "v" }, ";", ":")
vim.keymap.set("n", "<leader>w", function()
	vim.cmd([[w]])
end, {})
vim.keymap.set("n", "<leader>q", function()
	vim.cmd([[q]])
end, {})
vim.keymap.set("n", "<leader>x", function()
	vim.cmd([[q!]])
end, {})

vim.keymap.set({ "n", "v" }, "m", "<C-d>", {})
vim.keymap.set({ "n", "v" }, ",", "<C-u>", {})
vim.keymap.set("n", "<M-m>", function()
	vim.cmd([[bn]])
end)
vim.keymap.set("n", "<M-,>", function()
	vim.cmd([[bp]])
end)
vim.keymap.set("n", "<M-M>", function()
	vim.cmd([[tabn]])
end)
vim.keymap.set("n", "<M-<>", function()
	vim.cmd([[tabp]])
end)
