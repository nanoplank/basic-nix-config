{self, ...}: {
  flake.nixosModules.cli = {...}: {
    imports = [
      self.nixosModules.nh
      self.nixosModules.nushell
      self.nixosModules.nvf
    ];
  };
}
