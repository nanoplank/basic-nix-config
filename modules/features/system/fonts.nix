{...}: {
  flake.nixosModules.fonts = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      fira-code
      fira-code-symbols
      font-awesome
      hackgen-nf-font
      ibm-plex
      inter
      jetbrains-mono
      maple-mono.NF
      material-icons
      monocraft
      montserrat
      nerd-fonts.jetbrains-mono
      nerd-fonts.lilex
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
      powerline-fonts
      roboto
      roboto-mono
      source-sans
      source-serif
    ];
  };
}
