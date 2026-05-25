{...}: {
  flake.nixosModules.core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ripgrep
      ffmpeg
      lshw
      yazi
      tree
      fzf
      age
      vim
      git
      jq
    ];
  };
}
