{...}: {
  flake.nixosModules.terminal = {
    pkgs,
    lib,
    ...
  }: {
    hjem.users = {
      nixed = {
        files = {
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
