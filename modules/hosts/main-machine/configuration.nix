{self, ...}: {
  flake.nixosModules.mainMachineConfiguration = {
    config,
    pkgs,
    ...
  }: {
    imports = with self.nixosModules; [
      # hardware
      mainMachineHardware
      connectivity
      nvidia
      power
      disko

      # package bundles
      core
      extra
      gaming
      desktop
      fonts

      # desktop
      mangowc
      niri
      ly

      # system
      preservation
      user-nixed
      locale
      boot
      sops
      nix

      # security
      run0
      sudo

      # services
      minecraft-servers
      tailscale
      libvirtd
      openssh
      playit
      wivrn
      mpd

      # programs
      obs-studio
      fastfetch
      starship
      ghostty
      nushell
      zoxide
      helix
      kitty
      steam
      btop
      hjem
      git
      nh
    ];

    system.stateVersion = "25.11";
  };
}
