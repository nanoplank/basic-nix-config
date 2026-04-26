{...}: {
  flake.nixosModules.users = {pkgs, ...}: {
    users.users.nixed = {
      isNormalUser = true;
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
