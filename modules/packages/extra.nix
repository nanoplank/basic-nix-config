{...}: {
  flake.nixosModules.extra = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      android-tools
      pipes-rs
      torsocks
      cmatrix
      lazygit
      devenv
      yt-dlp
      oniux
      cava
      feh
      tor
    ];
  };
}
