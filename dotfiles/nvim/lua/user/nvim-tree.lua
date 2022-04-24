local tree_ok, nvim_tree = pcall(require, "nvim-tree")
if not tree_ok then
    print("unable to load nvim-tree")
    return
end

vim.g.nvim_tree_respect_buf_cwd = 1

nvim_tree.setup({
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
})

vim.cmd([[
  autocmd BufEnter * silent! lcd %:p:h
]])