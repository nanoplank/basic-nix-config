{...}: {
  flake.nixosModules.packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # core
      ffmpeg-full
      ripgrep
      yt-dlp
      age
      tree
      vim
      git
      jq
      lshw
      zoxide
      imagemagick

      # extra
      cava
      yazi
      btop
      cmatrix
      pipes-rs
      fastfetchMinimal
      oniux

      # desktop tools
      librewolf
      tor-browser
      keepassxc
      obsidian
      equibop
      gimp
      feather
      ghostty

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
