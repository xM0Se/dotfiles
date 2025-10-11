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
        -- Only run if started without file arguments (like `nvim .`)
        if #vim.fn.argv() == 0 and vim.fn.isdirectory(vim.fn.getcwd()) == 1 then
            -- Use pcall to avoid errors if telescope isn't loaded yet
            local ok, telescope = pcall(require, "telescope.builtin")
            if ok then
                telescope.find_files()
            end
        end
    end,
})
