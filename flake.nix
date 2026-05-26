{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation.url = "github:nix-community/preservation";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";

    hjem.follows = "hjem-rum/hjem";

    hjem-rum = {
      url = "github:snugnug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #    hjem = {
    #      url = "github:feel-co/hjem";
    #      inputs.nixpkgs.follows = "nixpkgs";
    #    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ncro.url = "github:feel-co/ncro";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake
    {inherit inputs;}
    (inputs.import-tree ./modules);
}
