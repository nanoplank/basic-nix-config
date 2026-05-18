{...}: {
  flake.nixosModules.fonts = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      fira-code
      fira-code-symbols
      inter
      jetbrains-mono
    ];
  };
}
