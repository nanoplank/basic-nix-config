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
      niri
      # kde
      ly

      # system
      preservation
      locale
      users
      boot
      sops
      nix

      # services
      minecraft-servers
      tailscale
      libvirtd
      openssh
      playit
      wivrn
      mpd

      # programs
      fastfetch
      starship
      ghostty
      nushell
      zoxide
      kitty
      steam
      btop
      hjem
      git
      nvf
      nh
    ];

    system.stateVersion = "25.11";
  };
}
