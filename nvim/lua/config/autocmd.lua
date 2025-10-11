-- Highlight on yank
local highlight_yank_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = highlight_yank_group,
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Get arguments safely
        local argv = vim.fn.argv()
        if #argv == 0 then
            return
        end

        local first_arg = argv[1]
        if vim.fn.isdirectory(first_arg) == 1 then
            local ok, telescope = pcall(require, "telescope.builtin")
            if ok then
                vim.cmd.cd(first_arg)
                -- Schedule Telescope after startup finishes
                vim.schedule(function()
                    telescope.find_files()
                end)
            else
                vim.notify("Telescope not available", vim.log.levels.WARN)
            end
        end
    end,
})
