{...}: {
  flake.nixosModules.core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ffmpeg
      yazi
      tree
      fzf
      age
      vim
      git
      mpv
      jq
    ];
  };
}
