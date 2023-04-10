{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bash.nix
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./tmux.nix
  ];

  users.users.oahlen = {
    packages = with pkgs; [
      bandwhich
      calc
      curl
      dog
      dos2unix
      du-dust
      duf
      fd
      figlet
      gping
      hexyl
      hyperfine
      jless
      kmon
      lowdown
      neofetch
      onefetch
      procs
      rage
      ripgrep
      sd
      tokei
      unzip
      wget
      xsv
      zip
    ];
  };

  home-manager.users.oahlen = {
    home.username = "oahlen";
    home.homeDirectory = "/home/oahlen";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.11";

    # Enable XDG user directories
    xdg = {
      enable = true;
      userDirs = {
        enable = true;
        createDirectories = true;
      };
    };

    programs = {
      zoxide.enable = true;
      ssh.enable = true;

      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      exa = {
        enable = true;
        enableAliases = true;
      };

      bat = {
        enable = true;
        config = {
          theme = "iceberg";
        };
        themes = {
          # nix-prefetch-url --unpack https://github.com/oahlen/iceberg.tmTheme/archive/1.0.0.tar.gz
          iceberg = builtins.readFile (pkgs.fetchFromGitHub {
              owner = "oahlen";
              repo = "iceberg.tmTheme";
              rev = "1.0.0";
              sha256 = "16lzyg47ddmlc2mixi2q61xpahk9jfrynp30148vkni7vhk4dbzd";
            }
            + "/iceberg.tmTheme");
        };
      };

      bottom = {
        enable = true;
        settings = {
          flags = {
            group_processes = true;
            mem_as_value = true;
          };
          colors = {
            table_header_color = "Cyan";
            widget_title_color = "White";
            avg_cpu_color = "Gray";
            cpu_core_colors = ["Red" "Green" "Yellow" "Blue" "Magenta" "Cyan" "LightRed" "LightGreen" "LightYellow" "LightBlue" "LightMagenta" "LightCyan"];
            ram_color = "Magenta";
            swap_color = "Yellow";
            rx_color = "Green";
            tx_color = "Cyan";
            border_color = "DarkGray";
            highlighted_border_color = "Blue";
            text_color = "Gray";
            selected_text_color = "Black";
            selected_bg_color = "Blue";
            graph_color = "Gray";
            high_battery_color = "Green";
            medium_battery_color = "Yellow";
            low_battery_color = "Red";
          };
          row = [
            {
              ratio = 30;
              child = [
                {
                  type = "cpu";
                }
              ];
            }
            {
              ratio = 40;
              child = [
                {
                  ratio = 4;
                  type = "proc";
                  default = true;
                }
                {
                  ratio = 3;
                  child = [
                    {
                      type = "temp";
                    }
                    {
                      type = "disk";
                    }
                  ];
                }
              ];
            }
            {
              ratio = 30;
              child = [
                {
                  type = "net";
                }
                {
                  type = "mem";
                }
              ];
            }
          ];
        };
      };

      fzf = {
        enable = true;
        defaultCommand = "fd --type f --hidden --follow";
        colors = {
          fg = "#c6c8d1";
          bg = "#161821";
          hl = "#e2a478";
          "fg+" = "#d2d4de";
          "bg+" = "#242940";
          "hl+" = "#e9b189";
          header = "#84a0c6";
          info = "#444b71";
          border = "#444b71";
          separator = "#444b71";
          prompt = "#b4be82";
          pointer = "#e2a478";
          marker = "#89b8c2";
          spinner = "#a093c7";
        };
      };

      jq = {
        enable = true;
        colors = {
          arrays = "0;37";
          false = "0;35";
          null = "1;35";
          numbers = "0;35";
          objects = "0;37";
          strings = "0;36";
          true = "0;35";
        };
      };

      lf = {
        enable = true;
        settings = {
          drawbox = true;
          hidden = true;
          icons = true;
        };
      };

      zathura = {
        enable = true;
        options = {
          selection-clipboard = "clipboard";
          font = "JetBrainsMono Nerd Font normal 11";

          recolor-lightcolor = "#161821";
          recolor-darkcolor = "#c6c8d1";
          recolor-keephue = true;
          default-bg = "#161821";

          statusbar-bg = "#0f1117";
          statusbar-fg = "#c6c8d1";
          inputbar-bg = "#161821";
          inputbar-fg = "#c6c8d1";

          notification-error-bg = "#e27878";
          notification-error-fg = "#1e2132";
          notification-warning-bg = "#e2a478";
          notification-warning-fg = "#1e2132";
          notification-bg = "#84a0c6";
          notification-fg = "#1e2132";

          highlight-color = "#e2a478";
          highlight-active-color = "#b4be82";
          highlight-transparency = "0.5";

          completion-bg = "#3d425b";
          completion-fg = "#c6c8d1";
          completion-group-bg = "#0f1117";
          completion-group-fg = "#818596";
          completion-highlight-bg = "#5b6389";
          completion-highlight-fg = "#eff0f4";
        };
      };
    };

    xdg.configFile = {
      "fd/ignore".text = ''
        .cache
        .dotnet
        .git
        .mozilla
      '';

      "ttyper/config.toml".source = ./../config/ttyper/config.toml;
    };
  };
}
