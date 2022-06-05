vim.diagnostic.open_float = (function(orig)
    return function(bufnr, opts)
        local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
        local opts = opts or {}
        -- A more robust solution would check the "scope" value in `opts` to
        -- determine where to get diagnostics from, but if you're only using
        -- this for your own purposes you can make it as simple as you like
        local diagnostics = vim.diagnostic.get(opts.bufnr or 0, {lnum = lnum})
        local max_severity = vim.diagnostic.severity.HINT
        for _, d in ipairs(diagnostics) do
            -- Equality is "less than" based on how the severities are encoded
            if d.severity < max_severity then
                max_severity = d.severity
            end
        end
        local border_color = ({
            [vim.diagnostic.severity.HINT]  = "DiagnosticHint",
            [vim.diagnostic.severity.INFO]  = "DiagnosticInfo",
            [vim.diagnostic.severity.WARN]  = "DiagnosticWarn",
            [vim.diagnostic.severity.ERROR] = "DiagnosticError",
        })[max_severity]
        
        opts.border = {
            {"╭", border_color},
            {"─", border_color},
            {"╮", border_color},
            {"│", border_color},
            {"╯", border_color},
            {"─", border_color},
            {"╰", border_color},
            {"│", border_color},
          }

        orig(bufnr, opts)
    end
end)(vim.diagnostic.open_float)

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


-- Show source in diagnostics, not inline but as a floating popup
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = "always",  -- Or "if_many"
  },
})

