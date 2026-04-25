{...}: {
  flake.nixosModules.hjemtest = {
    pkgs,
    lib,
    ...
  }: {
    hjem.users = {
      nixed = {
        files = {
          ".config/stuff/foo.nu".text = "foobar";
        };
      };
    };
  };
}
