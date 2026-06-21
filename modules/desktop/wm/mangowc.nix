{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.mangowc = {
    pkgs,
    lib,
    ...
  }: {
    programs = {
      mangowc = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.mangowrap;
      };
    };
  };

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.mangowrap = inputs.wrapper-modules.wrappers.mangowc.wrap {
      inherit pkgs;

      autostart_sh = ''
        ${lib.getExe self'.packages.noctaliawrap}
      '';

      extraConfig = ''
        source=/home/nixed/.config/mango/noctalia.conf
      '';

      settings = {
        # keyboard settings
        repeat_rate = 40;
        repeat_delay = 250;

        xkb_rules_layout = "us,ru";
        xkb_rules_options = "caps:swapescape";

        # trackpad settings
        trackpad_natural_scrolling = 1;

        # visiuals
        animations = 0;

        # layout settings

        # scroller

        scroller_default_proportion = 0.5;
        edge_scroller_pointer_focus = 0;
        scroller_structs = 20;

        # dwindle

        # dwindle_split_ratio = 0.5;
        # dwindle_smart_split = 1;

        # overview settings
        enable_hotarea = 0;

        # tags & monitors

        tagrule = [
          "id:1,layout_name:scroller"
          "id:2,layout_name:scroller"
          "id:3,layout_name:scroller"
          "id:4,layout_name:scroller"
          "id:5,layout_name:scroller"
          "id:6,layout_name:scroller"
          "id:7,layout_name:scroller"
          "id:8,layout_name:scroller"
          "id:9,layout_name:scroller"
          "id:10,layout_name:scroller"
        ];

        # key bindings

        bind = let
          mod = "SUPER";
        in [
          "${mod},r,spawn_shell,${lib.getExe pkgs.fuzzel} -I -f 'JetBrains Mono' --hide-before-typing --lines 1"
          "${mod},q,spawn,kitty"
          "${mod},l,spawn_shell,${lib.getExe self'.packages.noctaliawrap} ipc call lockScreen lock"
          "${mod},w,spawn_shell,${lib.getExe self'.packages.noctaliawrap} ipc call wallpaper toggle"
          "${mod},print,spawn_shell,${lib.getExe self'.packages.noctaliawrap} ipc call plugin:screen-toolkit annotate"

          "${mod},c,killclient"

          "${mod},Up,focusdir,up"
          "${mod},Down,focusdir,down"
          "${mod},Left,focusdir,left"
          "${mod},Right,focusdir,right"

          "${mod}+shift,Up,exchange_client,up"
          "${mod}+shift,Down,exchange_client,down"
          "${mod}+shift,Left,exchange_client,left"
          "${mod}+shift,Right,exchange_client,right"

          "${mod},f,togglemaximizescreen"
          "${mod}+shift,f,togglefloating"
          "${mod},g,togglefullscreen"

          "${mod},1,view,1,0"
          "${mod},2,view,2,0"
          "${mod},3,view,3,0"
          "${mod},4,view,4,0"
          "${mod},5,view,5,0"
          "${mod},6,view,6,0"
          "${mod},8,view,7,0"
          "${mod},9,view,8,0"
          "${mod},0,view,9,0"

          "${mod}+shift,1,tag,1,0"
          "${mod}+shift,2,tag,2,0"
          "${mod}+shift,3,tag,3,0"
          "${mod}+shift,4,tag,4,0"
          "${mod}+shift,5,tag,5,0"
          "${mod}+shift,6,tag,6,0"
          "${mod}+shift,8,tag,7,0"
          "${mod}+shift,9,tag,8,0"
          "${mod}+shift,0,tag,9,0"

          "NONE,XF86MonBrightnessUp,spawn,${lib.getExe pkgs.brightnessctl} s 2%+"
          "NONE,XF86MonBrightnessDown,spawn,${lib.getExe pkgs.brightnessctl} s 2%-"

          "NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          "NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

          "NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ];
      };
    };
  };
}
