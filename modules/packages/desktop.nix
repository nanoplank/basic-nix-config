{...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      tor-browser
      librewolf
      keepassxc
      obsidian
      feather
      ghostty
      scrcpy
    ];
  };
}
