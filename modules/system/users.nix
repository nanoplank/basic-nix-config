{...}: {
  flake.nixosModules.users = {
    config,
    pkgs,
    ...
  }: {
    users.users.nixed = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets.password-key.path;
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel" "libvirtd"];
      shell = pkgs.nushell;
    };
    sops.secrets.password-key.neededForUsers = true;
    users.mutableUsers = false;
  };
}
