{
  flake.nixosModules.packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # core
      ffmpeg-full
      git
      jq
      lshw
      btop
      zoxide
      imagemagick

      # extra
      cava
      cmatrix
      pipes-rs
      fastfetch
      yazi
      torsocks

      # desktop tools
      librewolf
      tor-browser
      keepassxc
      obsidian
      gimp

      # android
      android-tools
      scrcpy
      android-file-transfer
    ];

    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
