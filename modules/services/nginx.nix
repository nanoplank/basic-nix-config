{...}: let
  domain = "xmpp.stuff.com";
in {
  flake.nixosModules.nginx = {...}: {
    services = {
      nginx = {
        enable = true;
        virtualHosts.${domain} = {
          locations."/.well-known/acme-challenge".root = "/var/lib/acme/acme-challenge";
          locations."/".return = "404";
        };
      };
    };
  };
}
