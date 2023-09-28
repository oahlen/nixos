{pkgs, ...}: {
  programs.neovim = let
    fromLua = str: "lua << EOF\n${str}\nEOF\n";
    fromLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      cmp-buffer
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-path
      {
        plugin = comment-nvim;
        config = fromLua "require 'Comment'.setup()";
      }
      friendly-snippets
      {
        plugin = gitsigns-nvim;
        config = fromLuaFile ./plugins/gitsigns.lua;
      }
      {
        plugin = indent-blankline-nvim;
        config = fromLua ''
          require "indent_blankline".setup {
              space_char_blankline = " ",
              show_current_context = true,
              show_current_context_start = true,
          }'';
      }
      {
        plugin = leap-nvim;
        config = fromLua "require 'leap'.add_default_mappings()";
      }
      luasnip
      {
        plugin = nvim-autopairs;
        config = fromLuaFile ./plugins/autopairs.lua;
      }
      {
        plugin = nvim-cmp;
        config = fromLuaFile ./plugins/cmp.lua;
      }
      {
        plugin = nvim-colorizer-lua;
        config = fromLua "require 'colorizer'.setup()";
      }
      {
        plugin = nvim-dap;
        config = fromLuaFile ./plugins/dap.lua;
      }
      nvim-dap-virtual-text
      {
        plugin = nvim-lspconfig;
        config = fromLuaFile ./plugins/lsp.lua;
      }
      {
        plugin = nvim-surround;
        config = fromLua "require 'nvim-surround'.setup()";
      }
      {
        plugin = nvim-tree-lua;
        config = fromLuaFile ./plugins/nvim-tree.lua;
      }
      nvim-web-devicons
      omnisharp-extended-lsp-nvim
      plenary-nvim
      popup-nvim
      telescope-fzf-native-nvim
      {
        plugin = telescope-nvim;
        config = fromLuaFile ./plugins/telescope.lua;
      }
      telescope-ui-select-nvim
      {
        plugin = nvim-treesitter.withPlugins (plugins:
          with plugins; [
            c
            cmake
            comment
            c_sharp
            css
            dockerfile
            fish
            gitignore
            go
            html
            javascript
            json
            lua
            make
            markdown
            nix
            proto
            python
            query
            rust
            scss
            sql
            svelte
            toml
            tree-sitter-nix
            typescript
            vim
            vimdoc
            vimdoc
            yaml
          ]);
        config = fromLuaFile ./plugins/treesitter.lua;
      }
    ];

    extraLuaConfig = ''

      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymaps.lua}
      ${builtins.readFile ./commands.lua}
      require "statusline"
    '';
  };

  # Language servers and linters
  home.packages = with pkgs; [
    alejandra
    nil
    sumneko-lua-language-server
    zk
  ];

  xdg.configFile = {
    "nvim/ftdetect/avsc.vim".source = ./ftdetect/avsc.vim;
    "nvim/ftdetect/axaml.vim".source = ./ftdetect/axaml.vim;
    "nvim/lua/statusline/init.lua".source = ./lua/statusline/init.lua;
  };

  home.file = {
    ".local/share/nvim/site/pack/plugins/start/iceberg.nvim".source = builtins.fetchGit {
      url = "https://github.com/oahlen/iceberg.nvim";
      ref = "main";
      rev = "451508cc1e891179d224e48efcc1c94e87b6ffb5";
    };
  };
}
