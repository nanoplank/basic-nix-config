{...}: {
  flake.nixosModules.users = {
    config,
    pkgs,
    ...
  }: {
    sops.secrets."users/nixed/password".neededForUsers = true;
    users.mutableUsers = false;
    users.users.nixed = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/nixed/password".path;
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel" "libvirtd"];
      shell = pkgs.nushell;
    };
    sops.secrets."publickeys/key" = {};
    sops.templates."authorized_keys" = {
      owner = "nixed";
      content = ''
      ${config.sops.placeholder."publickeys/key"}
      '';
      path = "/home/nixed/.ssh/authorized_keys";
    };
  };
}
