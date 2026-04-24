return {
	'RRethy/vim-illuminate',
    config = function()
        require('illuminate').configure({
            -- providers: must be 'lsp', 'treesitter', or 'regex'
            -- i'll keep treesitter for now but wrap it if possible or see if there are other options
            providers = {
                'lsp',
                'treesitter',
                'regex',
            },
            -- delay: delay in milliseconds
            delay = 100,
            -- filetype_overrides: filetype specific overrides.
            -- The keys are strings to represent the filetype while the values are tables that
            -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
            filetype_overrides = {},
            -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
            filetypes_denylist = {
                'dirvish',
                'fugitive',
            },
            -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
            filetypes_allowlist = {},
            -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
            -- See `:help mode()` for possible values
            modes_denylist = {},
            -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
            -- See `:help mode()` for possible values
            modes_allowlist = {},
            -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
            -- Only applies to the 'regex' provider
            -- Use :echom synIDattr(synID(line("."), col("."), 1), "name") to find the syntax name
            providers_regex_syntax_denylist = {},
            -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
            -- Only applies to the 'regex' provider
            -- Use :echom synIDattr(synID(line("."), col("."), 1), "name") to find the syntax name
            providers_regex_syntax_allowlist = {},
            -- under_cursor: whether or not to illuminate under the cursor
            under_cursor = true,
            -- large_file_cutoff: number of lines at which to interrupt illumination
            large_file_cutoff = nil,
            -- large_file_config: config to use for large files (use nil to use default config)
            large_file_overrides = nil,
            -- min_count_to_highlight: minimum number of matches required to perform highlighting
            min_count_to_highlight = 1,
        })
    end
}
