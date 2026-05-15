{...}: {
  flake.nixosModules.users = {pkgs, ...}: {
    users.users.nixed = {
      isNormalUser = true;
      initialPassword = "12345";
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel" "libvirtd"];
      shell = pkgs.nushell;
    };

    hjem.users = {
      nixed = {
        user = "nixed";
        directory = "/home/nixed";
      };
    };
  };
}
