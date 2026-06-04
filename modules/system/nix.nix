{...}: {
  flake.nixosModules.nix = {pkgs, ...}: {
    programs.direnv = {
      enable = true;
      silent = false;
      loadInNixShell = true;
      direnvrcExtra = "";
      nix-direnv = {
        enable = true;
      };
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      nix-inspect
      alejandra
      nix-tree
      manix
      nixd
      nil
    ];
  };
}
