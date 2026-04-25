{...}: {
  flake.nixosModules.hjemtest = {
    pkgs,
    lib,
    ...
  }: {
    hjem.users = {
      nixed = {
        files = {
          ".config/nushell/env.nu".text = "foobar";
        };
      };
    };
  };
}
