return {
  -- Add codeium.vim
  {
    'nvim-neo-tree/neo-tree.nvim',
    config = function() require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Mostrar archivos ocultos
          hide_gitignored = true, -- Ocultar archivos ignorados por git
        },
      }
    })
    end,
  },
}


