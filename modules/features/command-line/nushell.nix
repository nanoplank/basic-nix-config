{...}: {
  flake.nixosModules.nushell = {...}: {
    hjem.users = {
      nixed = {
        files = {
          # nushell configuration
          ".config/nushell/env.nu".text = "
          zoxide init nushell | save -f ~/.zoxide.nu
          ";

          ".config/nushell/zoxide.nu".text = "";

          ".config/nushell/config.nu".text = "
          $env.config.show_banner = false
          $env.config.buffer_editor = 'nvim'
          mkdir ($nu.data-dir | path join 'vendor/autoload')
          starship init nu | save -f ($nu.data-dir | path join 'vendor/autoload/starship.nu')
          source ~/.zoxide.nu
          ";
        };
      };
    };
  };
}
