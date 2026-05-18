{...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      android-file-transfer
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
