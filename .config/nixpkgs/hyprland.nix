{ pkgs, ... }: let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  hyprland = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;

in {
  imports = [
    hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      monitor=eDP-1,highres,auto,1.25
      monitor=,preferred,auto,1
      monitor=DP-3,highres,auto,2

      exec-once = $HOME/.config/hypr/autostart

      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options = shift:both_capslock, compose:caps
          kb_rules =
          repeat_rate = 50
          repeat_delay = 250
          follow_mouse = 1

          touchpad {
              natural_scroll = true
          }

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
          gaps_in = 3
          gaps_out = 15
          border_size = 3
          col.active_border = rgba(ea76cbee)
          col.inactive_border = rgba(595959aa)

          layout = dwindle
      }

      decoration {
          rounding = 15
          blur = yes
          blur_size = 15
          blur_passes = 3
          blur_new_optimizations = on

          drop_shadow = no
          shadow_range = 10
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
      }

      animations {
          enabled = yes
          bezier = myBezier, 0.05, 0.9, 0.1, 1.1

          animation = windows, 1, 3, myBezier
          animation = windowsOut, 1, 4, default, popin 80%
          animation = border, 1, 7, default
          animation = fade, 1, 4, default
          animation = workspaces, 1, 3, default
      }

      dwindle {
          pseudotile = yes
          preserve_split = yes
      }

      master {
          new_is_master = true
      }

      gestures {
          workspace_swipe=yes
          workspace_swipe_fingers=4
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more

      windowrule = tile, ^(Matlab)$
      windowrule = tile, title:^(Spotify)$
      windowrule = workspace 9 silent, title:^(Spotify)$
      windowrule = workspace 10 silent, ^(discord)$

      # Keybinds
      $mainMod = SUPER

      # General
      bind = $mainMod, Q, killactive 
      bind = $mainMod SHIFT, SPACE, togglefloating, 
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, E, togglesplit, # dwindle
      bind = $mainMod, L, exec, swaylock
      bind = $mainMod, F, fullscreen

      # Programs
      bind = $mainMod, N, exec, thunar
      bind = $mainMod, RETURN, exec, wezterm
      bind = $mainMod, W, exec, firefox

      # Utilities
      bind = $mainMod SHIFT, E, exec, $HOME/.config/hypr/wofi-power.sh
      bind = $mainMod SHIFT, P, exec, $HOME/.config/hypr/wofi-ppd.sh
      bind = $mainMod, D, exec, wofi --show drun
      bind = $mainMod SHIFT, D, exec, wofi --show run
      bind = $mainMod SHIFT, S, exec, grimshot copy area
      bind = $mainMod, Print, exec, grimshot save screen
      bind = $mainMod SHIFT, C, exec, hyprpicker | wl-copy

      # Audio
      bindl =, XF86AudioMute, exec, amixer sset Master toggle
      bindel =, XF86AudioRaiseVolume, exec, amixer -D pulse sset Master 5%+
      bindel =, XF86AudioLowerVolume, exec, amixer -D pulse sset Master 5%-
      bindl =, XF86AudioPlay, exec, playerctl play-pause
      bindl =, XF86AudioNext, exec, playerctl next
      bindl =, XF86AudioPrev, exec, playerctl previous

      # Brightness
      bindel =, XF86MonBrightnessUp, exec, brightnessctl s +5%
      bindel =, XF86MonBrightnessDown, exec, brightnessctl s 5%-

      # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Move windows with shiftMod + arrow keys
      bind = $mainMod SHIFT, left, movewindow, l
      bind = $mainMod SHIFT, right, movewindow, r
      bind = $mainMod SHIFT, up, movewindow, u
      bind = $mainMod SHIFT, down, movewindow, d


      ###############
      # resize mode #
      ###############
      # will switch to a submap called resize
      bind=$mainMod, R, submap, resize

      submap=resize

      # sets repeatable binds for resizing the active window
      binde=,right,resizeactive,40 0
      binde=,left,resizeactive,-40 0
      binde=,up,resizeactive,0 -40
      binde=,down,resizeactive,0 40

      # use reset to go back to the global submap
      bind=,escape,submap,reset 

      # will reset the submap, meaning end the current one and return to the global one
      submap=reset
      ################

      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    '';
  };
}