{...}: {
  flake.nixosModules.terminal = {...}: {
    hjem.users = {
      nixed = {
        files = {
          # Ghostty
          ".config/ghostty/config.ghostty".text = "
          theme = noctalia
          confirm-close-surface = false
          shell-integration-features = ssh-env,ssh-terminfo
          background-opacity = 0.7
          ";
        };
      };
    };
    programs = {
      starship = {
        enable = true;
      };
    };
  };
}
