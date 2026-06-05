{...}: {
  flake.nixosModules.fonts = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      fira-code-symbols
      jetbrains-mono
      fira-code
      inter
    ];
  };
}
