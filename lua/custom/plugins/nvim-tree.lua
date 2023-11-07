-- Function to copy the relative path of the current directory in NvimTree
local function copyNvimTreeRelativePath()
  local node = require('nvim-tree.lib').get_node_at_cursor()
  if node then
    local relative_path = vim.fn.fnamemodify(node.absolute_path, ':~:.')
    vim.fn.setreg('+', relative_path)
    vim.notify('Copied NvimTree directory path (relative): ' .. relative_path)
  else
    vim.notify('No NvimTree node selected', vim.log.levels.WARN)
  end
end

local function copyNvimTreeAbsolutePath()
  local node = require('nvim-tree.lib').get_node_at_cursor()
  if node then
    vim.fn.setreg('+', node.absolute_path)
    vim.notify('Copied NvimTree directory path (absolute): ' .. node.absolute_path)
  else
    vim.notify('No NvimTree node selected', vim.log.levels.WARN)
  end
end

_G.copyNvimTreeRelativePath = copyNvimTreeRelativePath
_G.copyNvimTreeAbsolutePath = copyNvimTreeAbsolutePath

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}

    -- Toggle NvimTree
    vim.api.nvim_set_keymap("n", "<Leader>t", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

    -- NvimTreeGitStatus - Show Git status of the current directory
    vim.api.nvim_set_keymap("n", "<Leader>gs", ":NvimTreeGitStatus<CR>", { noremap = true, silent = true })

    -- NvimTreeFindFile - Open the NvimTree and highlight the current file
    vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

    -- NvimTreeRefresh - Refresh the NvimTree
    vim.api.nvim_set_keymap("n", "<Leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })

    -- NvimTreeToggleFocus - Toggle focus between NvimTree and the current window
    vim.api.nvim_set_keymap("n", "<Leader>w", ":NvimTreeToggleFocus<CR>", { noremap = true, silent = true })

    -- NvimTreeFindFile - Open the NvimTree and change to the current file's directory
    vim.api.nvim_set_keymap("n", "<Leader>cd", ":NvimTreeCd<CR>", { noremap = true, silent = true })

    -- NvimTreeToggleVCS - Toggle version control system column
    vim.api.nvim_set_keymap("n", "<Leader>vc", ":NvimTreeToggleVCS<CR>", { noremap = true, silent = true })

    -- NvimTreeOpen - Open file or directory under the cursor in NvimTree
    vim.api.nvim_set_keymap("n", "<Leader>o", ":NvimTreeOpen<CR>", { noremap = true, silent = true })

    -- NvimTreeOpenInSplit - Open file in vertical split
    vim.api.nvim_set_keymap("n", "<Leader>vs", ":NvimTreeOpenInSplit vsp<CR>", { noremap = true, silent = true })

    -- NvimTreeOpenInSplit - Open file in horizontal split
    vim.api.nvim_set_keymap("n", "<Leader>hs", ":NvimTreeOpenInSplit sp<CR>", { noremap = true, silent = true })

    -- NvimTreeCopyRelativePath - Copy the relative path of the current directory in NvimTree
    vim.api.nvim_set_keymap("n", "<Leader>cr", ":lua copyNvimTreeRelativePath()<CR>", { noremap = true, silent = true })

    -- NvimTreeCopyAbsolutePath - Copy the absolute path of the current directory in NvimTree
    vim.api.nvim_set_keymap("n", "<Leader>cA", ":lua copyNvimTreeAbsolutePath()<CR>", { noremap = true, silent = true })
  end,
}

