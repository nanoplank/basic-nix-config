{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.minimalMachine = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.minimalMachineConfiguration
    ];
  };
}
