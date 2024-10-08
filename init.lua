-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- vim.cmd([[autocmd BufEnter * Neotree]])
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- Verificar si no hay archivos abiertos y estamos en la pantalla de inicio
    local no_name = vim.api.nvim_buf_get_name(0) == "" -- buffer sin nombre
    local argc = vim.fn.argc() == 0 -- no se pasaron archivos en el arranque

    if argc and no_name then
      require("neo-tree.command").execute({ action = "show" }) -- comando correcto
    end
  end,
})

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"
