{...}: {
  flake.nixosModules.nixed = {
    config,
    pkgs,
    ...
  }: {
    users = {
      mutableUsers = false;
      users = {
        nixed = {
          isNormalUser = true;
          hashedPasswordFile = config.sops.secrets."users/nixed/password".path;
          description = "Nixed";
          extraGroups = ["networkmanager" "wheel" "libvirtd"];
          shell = pkgs.nushell;
        };
      };
    };
    sops = {
      secrets = {
        "publickeys/key" = {};
        "users/nixed/password".neededForUsers = true;
      };
      templates = {
        "authorized_keys" = {
          owner = "nixed";
          content = ''
            ${config.sops.placeholder."publickeys/key"}
          '';
          path = "/home/nixed/.ssh/authorized_keys";
        };
      };
    };
  };
}
