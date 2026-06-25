{...}: let
  domain = "xmpp.stuff.com";
  mucDomain = "conference.${domain}";
  uploadDomain = "upload.${domain}";
in {
  flake.nixosModules.acme = {...}: {
    security = {
      acme = {
        acceptTerms = true;
        defaults = {
          email = "stuff@foobar.com";
          certs = {
            ${domain} = {
              group = "certs";
              webroot = "/var/lib/acme/acme-challenge";
              postRun = "systemctl reload prosody.service";
              extraDomainNames = [mucDomain uploadDomain];
            };
          };
        };
      };
    };
  };
}
