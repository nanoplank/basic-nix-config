{...}: {
  flake.nixosModules.core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ripgrep
      zoxide
      ffmpeg
      lshw
      btop
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
