{...}: {
  flake.nixosModules.extra = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      fastfetch.minimal
      android-tools
      pipes-rs
      torsocks
      cmatrix
      yt-dlp
      oniux
      cava
      feh
      tor
    ];
  };
}
