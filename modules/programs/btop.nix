{...}: {
  flake.nixosModules.btop = {...}: {
    hjem.users = {
      nixed = {
        files = {
          ".config/btop/btop.conf".text = ''
            color_theme = "noctalia"
            theme_background = false
            proc_tree = true
            update_ms = 1000;
          '';
        };
      };
    };
  };
}
