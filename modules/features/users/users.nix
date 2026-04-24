{
  flake.nixosModules.users = {
    pkgs,
    lib,
    ...
  }: {
    users.users.nixed = {
      isNormalUser = true;
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.nushell;
    };

    hjem.users = {
      nixed = {
        user = "nixed";
        directory = "/home/nixed";
        files = {
          ".config/test.json".text = "
          stuff
          foo
          bar
          ";
        };
      };
    };
  };
}
