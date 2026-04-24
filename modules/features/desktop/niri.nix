{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri = {
    pkgs,
    lib,
    ...
  }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };

    environment.systemPackages = with pkgs; [
      pywalfox-native
      qt6Packages.qt6ct
      grim
      slurp
      tesseract
      translate-shell
      zbar
      wl-screenrec
    ];
  };

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;

      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];

        prefer-no-csd = {};

        window-rule = {
          geometry-corner-radius = 20;
          clip-to-geometry = true;
        };

        input = {
          focus-follows-mouse = {};

          keyboard = {
            xkb = {
              layout = "us,ru";
            };
            repeat-rate = 40;
            repeat-delay = 250;
          };

          touchpad = {
            natural-scroll = {};
            tap = {};
          };

          mouse = {
            accel-profile = "flat";
          };
        };

        outputs = {
          "eDP-1" = {
            hot-corners = {
              off = {};
            };
          };
        };

        binds = {
          "Mod+Q".spawn = lib.getExe pkgs.ghostty;
          "Mod+R".spawn = lib.getExe pkgs.fuzzel;
          "Mod+C".close-window = {};
          "Mod+F".maximize-column = {};
          "Mod+G".fullscreen-window = {};
          "Mod+V".toggle-window-floating = {};
          "Mod+L".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call lockScreen lock";
          "Mod+P".spawn-sh = "niri msg action set-dynamic-cast-window --id $(niri msg --json focused-window | jq .id)";
          "Mod+W".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call wallpaper toggle";
          "Mod+Print".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call plugin:screen-toolkit annotate";
          "Mod+N".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call plugin:screen-toolkit colorPicker";

          "Mod+Left".focus-column-left = {};
          "Mod+Right".focus-column-right = {};
          "Mod+Up".focus-window-up = {};
          "Mod+Down".focus-window-down = {};

          "Mod+Ctrl+Left".spawn-sh = "niri msg action consume-or-expel-window-left";
          "Mod+Ctrl+Right".spawn-sh = "niri msg action consume-or-expel-window-right";
          "Mod+Ctrl+Up".spawn-sh = "niri msg action consume-or-expel-window-up";
          "Mod+Ctrl+Down".spawn-sh = "niri msg action consume-or-expel-window-down";

          "Mod+Shift+Left".move-column-left = {};
          "Mod+Shift+Right".move-column-right = {};
          "Mod+Shift+Up".move-window-up = {};
          "Mod+Shift+Down".move-window-down = {};

          "Mod+1".focus-workspace = "w0";
          "Mod+2".focus-workspace = "w1";
          "Mod+3".focus-workspace = "w2";
          "Mod+4".focus-workspace = "w3";
          "Mod+5".focus-workspace = "w4";
          "Mod+6".focus-workspace = "w5";
          "Mod+7".focus-workspace = "w6";
          "Mod+8".focus-workspace = "w7";
          "Mod+9".focus-workspace = "w8";
          "Mod+0".focus-workspace = "w9";

          "Mod+Shift+1".move-column-to-workspace = "w0";
          "Mod+Shift+2".move-column-to-workspace = "w1";
          "Mod+Shift+3".move-column-to-workspace = "w2";
          "Mod+Shift+4".move-column-to-workspace = "w3";
          "Mod+Shift+5".move-column-to-workspace = "w4";
          "Mod+Shift+6".move-column-to-workspace = "w5";
          "Mod+Shift+7".move-column-to-workspace = "w6";
          "Mod+Shift+8".move-column-to-workspace = "w7";
          "Mod+Shift+9".move-column-to-workspace = "w8";
          "Mod+Shift+0".move-column-to-workspace = "w9";

          "XF86AudioRaiseVolume".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call volume increase";
          "XF86AudioLowerVolume".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call volume decrease";
          "XF86AudioMute".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call volume muteOutput";
          "XF86MonBrightnessUp".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call brightness increase";
          "XF86MonBrightnessDown".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call brightness decrease";
        };

        workspaces = let
          settings = {layout.gaps = 5;};
        in {
          "w0" = settings;
          "w1" = settings;
          "w2" = settings;
          "w3" = settings;
          "w4" = settings;
          "w5" = settings;
          "w6" = settings;
          "w7" = settings;
          "w8" = settings;
          "w9" = settings;
        };

        layout = {
          gaps = 5;

          focus-ring = {
            width = 2;
            active-color = "#8c8fa1";
          };
        };

        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
      };
    };
  };
}
