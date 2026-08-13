-- # Diagnostic
vim.diagnostic.config({
    -- Show error message beside the line
    virtual_text = true,

    -- (Optional) If you ONLY want it to show on the line where your cursor is:
    -- virtual_text = { current_line = true },

    underline = true,
    signs = true,
    update_in_insert = false,
    vim.diagnostic.config({
	float = {
	    border = "rounded",       -- "rounded", "single", "double", "solid", or "shadow"
	    source = "always",        -- Shows which LSP (e.g. intelephense, tsserver) reported it
	},
    })
})

