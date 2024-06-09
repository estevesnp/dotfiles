function CreateNamedMap(sect)
	return function(mode, keys, func, desc)
		vim.keymap.set(mode, keys, func, { desc = sect .. ": " .. desc })
	end
end

require("esteves.options")
require("esteves.keymaps")
require("esteves.lazy")
require("esteves.lazy-plugins")
