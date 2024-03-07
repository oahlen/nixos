{
  pkgs,
  inputs,
  system,
  ...
}: {
  programs.neovim = let
    iceberg-nvim = inputs.iceberg.packages.${system}.default;
  in {
    enable = true;
    vimAlias = true;
    defaultEditor = true;

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
      omnisharp-extended-lsp-nvim
      plenary-nvim
      popup-nvim
      telescope-fzf-native-nvim
      telescope-nvim
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
    zk
  ];

  xdg.configFile = {
    "nvim/ftdetect/avsc.vim".source = ./ftdetect/avsc.vim;
    "nvim/ftdetect/axaml.vim".source = ./ftdetect/axaml.vim;
    "nvim/lua/statusline/init.lua".source = ./lua/statusline/init.lua;
  };
}
