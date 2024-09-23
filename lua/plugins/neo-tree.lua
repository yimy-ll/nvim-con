return {
  -- Add codeium.vim
  {
    'nvim-neo-tree/neo-tree.nvim',
    config = function() require("neo-tree").setup({
      close_if_last_window = true, -- Cierra Neo-tree si es la última ventana abierta
      popup_border_style = "rounded", -- Estilo de borde para las ventanas emergentes
      enable_git_status = true, -- Habilita los iconos de estado de Git
      enable_diagnostics = true, -- Muestra diagnósticos en archivos (LSP)
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Mostrar archivos ocultos
          hide_gitignored = true, -- Ocultar archivos ignorados por git
        },
      },
    }) 
    end,
  },
}


