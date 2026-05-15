{self, ...}: {
  flake.nixosModules.system = {...}: {
    imports = [
      self.nixosModules.fonts
      self.nixosModules.locale
      self.nixosModules.connectivity
      self.nixosModules.nix
      self.nixosModules.users
    ];
  };
}
