{pkgs, ...}: {
  programs.neovim = let
    iceberg-nvim = import ./iceberg.nix {inherit pkgs;};
  in {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = false;
    withPython3 = false;
    withRuby = false;

    plugins = with pkgs.vimPlugins; [
      cmp-buffer
      cmp_luasnip
      cmp-nvim-lsp
      cmp-nvim-lua
      cmp-path
      comment-nvim
      conform-nvim
      friendly-snippets
      gitsigns-nvim
      iceberg-nvim
      indent-blankline-nvim
      leap-nvim
      luasnip
      nvim-autopairs
      nvim-cmp
      nvim-colorizer-lua
      nvim-dap
      nvim-dap-virtual-text
      nvim-lspconfig
      nvim-surround
      nvim-tree-lua
      nvim-web-devicons
      obsidian-nvim
      omnisharp-extended-lsp-nvim
      plenary-nvim
      popup-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      telescope-ui-select-nvim
      {
        plugin = nvim-treesitter.withPlugins (plugins:
          with plugins; [
            angular
            c
            cmake
            comment
            c_sharp
            css
            csv
            dockerfile
            fish
            gitattributes
            gitcommit
            git_config
            gitignore
            git_rebase
            go
            helm
            html
            java
            javascript
            json
            kotlin
            lua
            make
            markdown_inline
            nix
            pem
            proto
            python
            query
            regex
            rust
            scss
            sql
            svelte
            tmux
            toml
            typescript
            vim
            vimdoc
            yaml
          ]);
      }
      which-key-nvim
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./init.lua}
    '';
  };

  # Language servers and linters
  home.packages = with pkgs; [
    alejandra
    nil
    sumneko-lua-language-server
  ];

  xdg.configFile = {
    "nvim/ftdetect/avsc.vim".source = ./ftdetect/avsc.vim;
    "nvim/ftdetect/axaml.vim".source = ./ftdetect/axaml.vim;
    "nvim/ftdetect/flake.vim".source = ./ftdetect/flake.vim;

    "nvim/lua/plugins/cmp.lua".source = ./lua/plugins/cmp.lua;
    "nvim/lua/plugins/conform.lua".source = ./lua/plugins/conform.lua;
    "nvim/lua/plugins/dap.lua".source = ./lua/plugins/dap.lua;
    "nvim/lua/plugins/gitsigns.lua".source = ./lua/plugins/gitsigns.lua;
    "nvim/lua/plugins/lsp.lua".source = ./lua/plugins/lsp.lua;
    "nvim/lua/plugins/nvim-tree.lua".source = ./lua/plugins/nvim-tree.lua;
    "nvim/lua/plugins/telescope.lua".source = ./lua/plugins/telescope.lua;
    "nvim/lua/plugins/treesitter.lua".source = ./lua/plugins/treesitter.lua;
    "nvim/lua/plugins/which-key.lua".source = ./lua/plugins/which-key.lua;

    "nvim/lua/statusline/init.lua".source = ./lua/statusline/init.lua;
  };
}
