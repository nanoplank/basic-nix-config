{...}: {
  flake.nixosModules.users = {
    config,
    pkgs,
    ...
  }: {
    users.users.nixed = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$xyD4ZUtv.8NHxC0L7sjsG/$vmjKXrthrSRaxPvRhv/0z8AUY51aRQYSrZwNWaxJbv0";
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel" "libvirtd"];
      shell = pkgs.nushell;
    };

    sops.secrets.password-key.neededForUsers = true;
    users.mutableUsers = false;

    hjem.users = {
      nixed = {
        user = "nixed";
        directory = "/home/nixed";
      };
    };
  };
}
