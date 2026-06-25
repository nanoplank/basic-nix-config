{...}: {
  flake.nixosModules.snapper = {...}: {
    services = {
      snapper = {
        configs = {
          persistent = {
            FSTYPE = "btrfs";
            SUBVOLUME = "/persistent";
            ALLOW_USERS = ["nixed"];
            TIMELINE_CREATE = true;
            TIMELINE_CLEANUP = true;
          };
        };
      };
    };
  };
}
