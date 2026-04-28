{...}: {
  flake.nixosModules.packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # core
      ffmpeg-full
      pinentry-all
      ripgrep
      gnupg
      tree
      vim
      git
      jq
      lshw
      zoxide
      imagemagick

      # extra
      cava
      btop
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

      # KDE
      kdePackages.kleopatra

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
