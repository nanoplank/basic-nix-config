{...}: {
  flake.nixosModules.nvf = {pkgs, ...}: {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          theme = {
            enable = true;
            transparent = true;
          };

          keymaps = [
            {
              key = "<leader>m";
              mode = "n";
              silent = true;
              action = ":Neotree";
            }
          ];

          binds = {
            whichKey = {
              enable = true;
              setupOpts = {
                preset = "helix";
              };
            };
          };

          clipboard = {
            enable = true;
            providers = {
              wl-copy.enable = true;
            };
            registers = "unnamedplus";
          };

          statusline = {
            lualine = {
              enable = true;
            };
          };

          telescope = {
            enable = true;
          };

          autocomplete = {
            nvim-cmp.enable = true;
          };

          treesitter = {
            enable = true;
          };

          lsp = {
            enable = true;
          };

          git = {
            enable = true;
          };

          filetree = {
            neo-tree = {
              enable = true;
              setupOpts = {
                enable_git_status = true;
              };
            };
          };

          utility = {
            ccc.enable = false;
            diffview-nvim.enable = true;
            grug-far-nvim.enable = true;

            motion = {
              hop.enable = true;
              leap.enable = true;
            };
          };

          terminal = {
            toggleterm = {
              enable = true;
            };
          };

          languages = {
            rust = {
              enable = true;
            };

            nu = {
              enable = true;
            };

            nix = {
              enable = true;
              format = {
                enable = true;
              };
            };

            zig = {
              enable = true;
            };

            haskell = {
              enable = true;
            };

            typescript = {
              enable = true;
            };

            python = {
              enable = true;
            };

            lua = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
