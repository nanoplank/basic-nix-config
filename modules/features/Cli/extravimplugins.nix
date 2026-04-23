{
  flake.nixosModules.extravimplugins = {pkgs, ...}: {
    config.vim.extraPlugins = {
      aerial = {
        package = pkgs.vimPlugins.aerial-nvim;
        setup = "require('aerial').setup {}";
      };
    };
  };
}
