{...}: {
  flake.nixosModules.wivrn = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      wayvr
    ];
    services = {
      wivrn = {
        enable = true;
        autoStart = false;
        openFirewall = true;
      };
    };
  };
}
