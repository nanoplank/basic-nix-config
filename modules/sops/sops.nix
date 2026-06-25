{inputs, ...}: {
  flake.nixosModules.sops = {pkgs, ...}: {
    imports = [inputs.sops-nix.nixosModules.sops];

    environment = {
      systemPackages = with pkgs; [
        ssh-to-age
        rops
        sops
        age
      ];
    };

    sops = {
      defaultSopsFile = ../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age = {
        keyFile = "/persistent/sops/age/keys.txt";
      };
    };
  };
}
