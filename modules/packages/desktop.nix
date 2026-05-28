{...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      kdePackages.dolphin
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
