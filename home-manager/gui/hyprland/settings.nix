{
  monitor = ",1920x1080@60,0x0,1";

  # input = {
  #   sensitivity = -0.5;
  # };

  # general = {
  #   gaps_in = 4;
  #   gaps_out = 17;
  #
  #   border_size = 2;
  #   col.active_border = "0xf0b155f7";
  #   col.inactive_border = "0x66333333";
  # };

  # decoration = {
  #   rounding = 10;
  #   blur = {
  #     size = 3;
  #     passes = 1;
  #   };
  # };

  # animations = {
  #   animation = [
  #     "windows,1,7,default"
  #     "border,1,10,default"
  #     "fade,1,10,default"
  #     "workspaces,1,6,default"
  #   ];
  # };

  exec-once = [
    "foot --server"
  ];

  bind = [
    # terminal
    "SUPER,return,exec,footclient"
    # launcher
    "SUPER,space,exec,rofi -show drun -show-icon"
    # logout
    "SUPERSHIFT,escape,exec,wlogout"

    "SUPER,P,pseudo"
    "SUPER,F,togglefloating"
    "SUPER,backspace,killactive"
    "SUPERSHIFT,return,fullscreen,0"

    # special workspace
    "SUPER_SHIFT,O,movetoworkspace,special"
    "SUPER,O,togglespecialworkspace"

    # move active
    "SUPERALT,H,moveactive,-20 0"
    "SUPERALT,L,moveactive,20 0"
    "SUPERALT,J,moveactive,0 20"
    "SUPERALT,K,moveactive,0 -20"

    # resize active
    "SUPERCTRL,H,resizeactive,-20 0"
    "SUPERCTRL,L,resizeactive,20 0"
    "SUPERCTRL,J,resizeactive,0 20"
    "SUPERCTRL,K,resizeactive,0 -20"

    # move window
    "SUPERSHIFT,H,movewindow,l"
    "SUPERSHIFT,L,movewindow,r"
    "SUPERSHIFT,K,movewindow,u"
    "SUPERSHIFT,J,movewindow,d"

    # move focus
    "SUPER,H,movefocus,l"
    "SUPER,L,movefocus,r"
    "SUPER,K,movefocus,u"
    "SUPER,J,movefocus,d"

    # switch workspace
    "ALT,1,workspace,1"
    "ALT,2,workspace,2"
    "ALT,3,workspace,3"
    "ALT,4,workspace,4"
    "ALT,5,workspace,5"
    "ALT,6,workspace,6"
    "ALT,7,workspace,7"
    "ALT,8,workspace,8"
    "ALT,9,workspace,9"
    "ALT,0,workspace,0"

    # move to workspace
    "SUPER,1,movetoworkspace,1"
    "SUPER,2,movetoworkspace,2"
    "SUPER,3,movetoworkspace,3"
    "SUPER,4,movetoworkspace,4"
    "SUPER,5,movetoworkspace,5"
    "SUPER,6,movetoworkspace,6"
    "SUPER,7,movetoworkspace,7"
    "SUPER,8,movetoworkspace,8"
    "SUPER,9,movetoworkspace,9"
    "SUPER,0,movetoworkspace,0"
  ];
}
