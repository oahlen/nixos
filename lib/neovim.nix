{
  config,
  pkgs,
  ...
}: {
  home-manager.users.oahlen = {pkgs, ...}: {
    programs.neovim = {
      enable = true;
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
        nvim-tree-lua
        omnisharp-extended-lsp-nvim
        plenary-nvim
        popup-nvim
        telescope-fzf-native-nvim
        telescope-ui-select-nvim
        telescope-nvim
        (nvim-treesitter.withPlugins (plugins:
          with plugins; [
            tree-sitter-nix
            c
            c_sharp
            cmake
            comment
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
            typescript
            vim
            yaml
          ]))
      ];
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
  };
}
