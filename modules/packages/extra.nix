{...}: {
  flake.nixosModules.extra = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
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
