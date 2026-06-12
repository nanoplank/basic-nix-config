{...}: let
  domain = "xmpp.stuff.com";
  mucDomain = "conference.${domain}";
  uploadDomain = "upload.${domain}";
in {
  flake.nixosModules.prosody = {...}: {
    services = {
      prosody = {
        enable = true;
        admins = ["admin@${domain}"];

        ssl = {
          cert = "/var/lib/acme/${domain}/fullchain.pem";
          key = "/var/lib/acme/${domain}/key.pem";
        };

        httpFileShare = {
          dommain = uploadDomain;
          uploadFileSizeLimit = 100 * 1024 * 1024;
        };

        muc = [
          {
            domain = mucDomain;
            name = "Chat Rooms";
            restrictRoomCreaton = false;
          }
        ];

        virtualHosts.${domain} = {
          enabled = true;
          domain = domain;
          ssl = {
            cert = "/var/lib/acme/${domain}/fullchain.pem";
            key = "/var/lib/acme/${domain}/key.pem";
          };
        };

        modules = {
          roster = true;
          saslauth = true;
          tls = true;
          dialback = true;
          disco = true;
          carbons = true;
          pep = true;
          mam = true;
          ping = true;
          admin_adhoc = true;
          http_files = true;
        };

        allowRegistration = false;
      };
    };
    networking = {
      firewall = {
        allowedTCPPorts = [80 443 5281 5222 5259];
      };
    };
  };
}
