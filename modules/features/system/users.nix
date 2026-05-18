{...}: {
  flake.nixosModules.users = {pkgs, ...}: {
    users.users.nixed = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$JQ6ynoC.yHTDsXtM/0Nyi0$iWEC/6a/6dnpols.w6fHYCismhqX.jPgieNknqUGBW7";
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel" "libvirtd"];
      shell = pkgs.nushell;
    };

    users.mutableUsers = false;

    hjem.users = {
      nixed = {
        user = "nixed";
        directory = "/home/nixed";
      };
    };
  };
}
