{pkgs, ...}: {
  programs.neovim = {
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
      comment-nvim
      friendly-snippets
      indent-blankline-nvim
      leap-nvim
      luasnip
      # mason-nvim - enable in 23.05
      nvim-autopairs
      nvim-cmp
      nvim-colorizer-lua
      nvim-dap
      nvim-dap-virtual-text
      nvim-lspconfig
      nvim-surround
      nvim-tree-lua
      nvim-web-devicons
      omnisharp-extended-lsp-nvim
      plenary-nvim
      popup-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      telescope-nvim
      vim-tmux-navigator
      (nvim-treesitter.withPlugins (plugins:
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
          help
          html
          javascript
          json
          lua
          make
          markdown
          nix
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
          yaml
        ]))
    ];

    extraConfig = ''
      :source ${./init.lua}
    '';
  };

  home.packages = with pkgs; [
    sumneko-lua-language-server
  ];

  xdg.configFile = {
    "nvim/ftdetect/avsc.vim".source = ./ftdetect/avsc.vim;
    "nvim/ftdetect/axaml.vim".source = ./ftdetect/axaml.vim;

    "nvim/lua/user/autopairs.lua".source = ./lua/user/autopairs.lua;
    "nvim/lua/user/cmp.lua".source = ./lua/user/cmp.lua;
    "nvim/lua/user/dap.lua".source = ./lua/user/dap.lua;
    "nvim/lua/user/keymaps.lua".source = ./lua/user/keymaps.lua;
    "nvim/lua/user/lsp.lua".source = ./lua/user/lsp.lua;
    "nvim/lua/user/nvim-tree.lua".source = ./lua/user/nvim-tree.lua;
    "nvim/lua/user/options.lua".source = ./lua/user/options.lua;
    "nvim/lua/user/telescope.lua".source = ./lua/user/telescope.lua;
    "nvim/lua/user/treesitter.lua".source = ./lua/user/treesitter.lua;
    "nvim/lua/user/statusline.lua".source = ./lua/user/statusline.lua;
  };

  home.file = {
    ".local/share/nvim/site/pack/plugins/start/iceberg.nvim".source = builtins.fetchGit {
      url = "https://github.com/oahlen/iceberg.nvim";
      ref = "main";
      rev = "7c8886db6aa07dee8152246099dc680689d41884";
    };

    ".local/share/nvim/site/pack/plugins/start/mason.nvim".source = builtins.fetchGit {
      url = "https://github.com/williamboman/mason.nvim";
      ref = "main";
      rev = "5c3cf2f134d8cc6798e6e3177025fb2f103a4053";
    };
  };
}
