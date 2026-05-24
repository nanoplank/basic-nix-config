{...}: {
  flake.nixosModules.sops = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ssh-to-age
      rops
      sops
      age
    ];

    sops.defaultSopsFile = ./secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/persistent/sops/age/keys.txt";
  };
}
