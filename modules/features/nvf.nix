{
  flake.nixosModules.nvf = {pkgs, ...}: {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          theme = {
            enable = true;
            name = "everforest";
          };

          statusline.lualine.enable = true;
          telescope.enable = true;
          autocomplete.nvim-cmp.enable = true;
          treesitter.enable = true;
          lsp.enable = true;

          presence = {
            neocord.enable = true;
          };

          git = {
            enable = true;
            neogit.enable = true;
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
