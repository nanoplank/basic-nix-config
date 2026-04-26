{...}: {
  flake.nixosModules.terminal = {...}: {
    hjem.users = {
      nixed = {
        files = {
          # Ghostty
          ".config/ghostty/config.ghostty".text = "
          theme = noctalia
          confirm-close-surface = false
          custom-shader-animation = always
          custom-shader = shaders/cursor_tail.glsl
          shell-integration-features = ssh-env,ssh-terminfo
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
