-- HELLO, welcome to NormalNvim!
-- ---------------------------------------
-- This is the entry point of your config.
-- ---------------------------------------

local function load_source(source)
  local status_ok, error = pcall(require, source)
  if not status_ok then
    vim.api.nvim_echo(
      {{"Failed to load " .. source .. "\n\n" .. error}}, true, {err = true}
    )
  end
end

local function load_sources(source_files)
  vim.loader.enable()
  for _, source in ipairs(source_files) do
    load_source(source)
  end
end

local function load_sources_async(source_files)
  for _, source in ipairs(source_files) do
    vim.defer_fn(function()
      load_source(source)
    end, 50)
  end
end

local function load_colorscheme_async(colorscheme)
  vim.defer_fn(function()
    if vim.g.default_colorscheme then
      if not pcall(vim.cmd.colorscheme, colorscheme) then
        require("base.utils").notify(
          "Error setting up colorscheme: " .. colorscheme,
          vim.log.levels.ERROR
        )
      end
    end
  end, 0)
end

-- Call the functions defined above.
load_sources({
  "base.1-options",
  "base.2-lazy",
  "base.3-autocmds", -- critical stuff, don't change the execution order.
})
load_colorscheme_async(vim.g.default_colorscheme)
load_sources_async({ "base.4-mappings" })

vim.opt.wrap = false
vim.opt.shiftwidth = 8
vim.opt.tabstop = 8

-- Copy to and paste from system buffer
vim.opt.clipboard = "unnamedplus"
-- In order to pass .vimrc config to nvim
vim.cmd([[
        set runtimepath^=~/.vim runtimepath+=~/.vim/after
        let &packpath = &runtimepath
        source ~/.vimrc
        ]])
vim.b.minianimate_config = { scroll = { enable = false } }
-- For Mipsy plugin. Follow instructions if you wanna install:
-- https://github.com/XavierCooney/mipsy-editor-features?tab=readme-ov-file#neovim

--local lspconfig = require("lspconfig")
--require('mipsy').setup()
--lspconfig.mipsy_editor_features.setup({})
