{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.mainMachine = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.mainMachineConfiguration
    ];
  };
}
