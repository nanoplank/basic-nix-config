{...}: {
  flake.nixosModules.extra = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      android-tools
      pipes-rs
      torsocks
      cmatrix
      devenv
      yt-dlp
      oniux
      cava
      feh
      tor
    ];
  };
}
