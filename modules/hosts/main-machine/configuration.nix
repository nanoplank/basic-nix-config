{self, ...}: {
  flake.nixosModules.mainMachineConfiguration = {
    config,
    pkgs,
    ...
  }: {
    imports = with self.nixosModules; [
      # boot
      initrd
      kernel

      # boot/loader
      systemd-boot
      efi

      # disko
      disko

      # environment
      variables

      # environment/systemPackages
      core
      extra
      gaming
      desktop

      # fonts
      fonts

      # hardware
      mainMachineHardware
      bluetooth
      nvidia

      # i18n
      defaultLocale
      extraLocaleSettings

      # networking
      networkmanager
      firewall
      hostName

      # nix
      nix

      # preservation
      preservation

      # programs
      obs-studio
      gamescope
      fastfetch
      starship
      gamemode
      ghostty
      nushell
      mangowc
      zoxide
      helix
      kitty
      steam
      btop
      niri
      hjem
      git
      nh

      # security
      run0
      sudo

      # services
      power-profiles-daemon
      minecraft-servers
      tailscale
      libvirtd
      pipewire
      snapper
      openssh
      playit
      upower
      wivrn
      mpd
      ly

      # sops
      sops

      # system
      stateVersion

      # systemd
      suppressedSystemUnits

      # time
      timeZone

      # users
      nixed
    ];
  };
}
