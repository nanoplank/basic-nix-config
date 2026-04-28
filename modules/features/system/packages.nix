{...}: {
  flake.nixosModules.packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # core
      ffmpeg-full
      pinentry-all
      ripgrep
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

      # android
      android-tools
      scrcpy
      android-file-transfer
    ];

    programs = {
      nano.enable = false;
      gnupg = {
        package = pkgs.gnupg;
      };
      obs-studio = {
        enable = true;
        enableVirtualCamera = true;
      };
    };
  };
}
