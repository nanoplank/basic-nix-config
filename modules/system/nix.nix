{...}: {
  flake.nixosModules.nix = {pkgs, ...}: {
    nix = {
      package = pkgs.lixPackageSets.stable.lix;
      settings = {
        experimental-features = ["nix-command" "flakes"];
      };
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };

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
