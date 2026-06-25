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
        permittedInsecurePackages = [
          "librewolf-unwrapped-151.0.2-1"
          "librewolf-151.0.2-1"
        ];
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
