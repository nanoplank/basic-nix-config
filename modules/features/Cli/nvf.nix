{
  flake.nixosModules.nvf = {pkgs, ...}: {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          theme = {
            enable = true;
            transparent = true;
          };

          lazy = {
            enable = true;

            plugins = {
              smear-cursor-nvim = {
                package = "smear-cursor-nvim";
                setupModule = "smear-cursor";
              };
            };
          };

          statusline.lualine.enable = true;
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;
          treesitter.enable = true;
          lsp.enable = true;

          git = {
            enable = true;
          };

          languages = {
            rust.enable = true;
            nix.enable = true;
            typescript.enable = true;
            python.enable = true;
            lua.enable = true;
          };
        };
      };
    };
  };
}
