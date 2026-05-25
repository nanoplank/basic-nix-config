{...}: {
  flake.nixosModules.users = {
    config,
    pkgs,
    ...
  }: {
    users.users.nixed = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets."users/nixed/password".path;
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel" "libvirtd"];
      shell = pkgs.nushell;
    };
    sops.secrets."users/nixed/password".neededForUsers = true;
    users.mutableUsers = false;
  };
}
