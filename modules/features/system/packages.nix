{...}: {
  flake.nixosModules.packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # core
      ffmpeg-full
      ripgrep
      tree
      vim
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
      oniux

      # desktop tools
      librewolf
      tor-browser
      keepassxc
      obsidian
      gimp
      feather

      # android
      android-tools
      scrcpy
      android-file-transfer
    ];

    programs = {
      nano.enable = false;
      obs-studio = {
        enable = true;
        enableVirtualCamera = true;
      };
    };
  };
}
