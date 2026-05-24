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
  };
}
