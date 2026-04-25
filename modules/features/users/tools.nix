{self, ...}: {
  flake.nixosModules.desktop = {...}: {
    imports = [
      self.nixosModules.gaming
      self.nixosModules.ly
      self.nixosModules.niri
      self.nixosModules.packages
    ];
  };
}
