{...}: {
  flake.nixosModules.packages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      # core
      ffmpeg-full
      ripgrep
      yt-dlp
      tree
      feh
      age
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
      tor
      torsocks

      # desktop tools
      librewolf
      tor-browser
      keepassxc
      obsidian
      feather
      ghostty

      # android
      android-tools
      scrcpy
      android-file-transfer
    ];

    programs = {
      obs-studio = {
        enable = true;
        enableVirtualCamera = true;
      };
    };
  };
}
