{...}: {
  flake.nixosModules.defaultLocale = {...}: {
    i18n = {
      defaultLocale = "en_US.UTF-8";
    };
  };
}
