{...}: {
  flake.nixosModules.services = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      rmpc
    ];
    services = {
      mpd = {
        enable = true;
        musicDirectory = "/home/nixed/Music";
        dataDir = "/home/nixed/Music/mpd";
      };
    };
  };
}
