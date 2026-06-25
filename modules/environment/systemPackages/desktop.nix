{...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment = {
      systemPackages = with pkgs; [
        tor-browser
        librewolf
        keepassxc
        feather
        ghostty
        scrcpy
        gajim
      ];
    };
  };
}
