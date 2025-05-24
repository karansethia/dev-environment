return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        theme = 'catppuccin', -- Use the Catppuccin theme for lualine
        section_separators = { left = "", right = "" },
        component_separators = '',
        icons_enabled = true,
      },
      dependencies = {
        -- https://github.com/nvim-tree/nvim-web-devicons
        'nvim-tree/nvim-web-devicons',    -- fancy icons
        -- https://github.com/linrongbin16/lsp-progress.nvim
        'linrongbin16/lsp-progress.nvim', -- LSP loading progress
        "catppuccin/nvim",                -- theme
      },
      -- You can further customize sections here:
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
