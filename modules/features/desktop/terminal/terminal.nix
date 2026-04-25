{...}: {
  flake.nixosModules.terminal = {
    pkgs,
    lib,
    self,
    ...
  }: {
    imports = [
      self.nixosModules.terminalshaders
    ];

    hjem.users = {
      nixed = {
        files = {
          # Ghostty
          ".config/ghostty/config.ghostty".text = "
theme = noctalia
confirm-close-surface = false
custom-shader-animation = always
custom-shader = shaders/cursor_tail.glsl
          ";
        };
      };
    };
  };
}
