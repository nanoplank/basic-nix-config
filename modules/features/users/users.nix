{
  flake.nixosModules.users = {
    pkgs,
    lib,
    ...
  }: {
    users.users.nixed = {
      isNormalUser = true;
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.nushell;
    };

    hjem.users = {
      nixed = {
        user = "nixed";
        directory = "/home/nixed";
        files = {
          # nushell configuration
          ".config/nushell/env.nu".text = "
          zoxide init nushell | save -f ~/.zoxide.nu
          ";

          ".config/nushell/zoxide.nu".text = "";

          ".config/nushell/config.nu".text = "
          $env.config.show_banner = false
          source ~/.zoxide.nu
          ";

          # Ghostty
          ".config/ghostty/config.ghostty".text = "
          theme = noctalia
          confirm-close-surface = false
          ";
        };
      };
    };
  };
}
