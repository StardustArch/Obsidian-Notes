{ config, pkgs, ... }:

{
  imports = [
  ];

  fileSystems."/" = { device = "/dev/sda1"; fsType = "ext4"; };
    
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "net.ifnames=0" "ipv6.disable=1" ];
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  environment.systemPackages = with pkgs; [
    vim
    mc
    #gnome3.gnome-terminal
    #gnome3.gedit
    deepin.deepin-menu
    deepin.deepin-terminal
    pcmanfm
    #gnome3.gedit
    firefox
    hicolor-icon-theme
    ######################################
    deepin.dbus-factory
    deepin.dde-api
    deepin.dde-calendar
    deepin.dde-daemon
    #deepin.dde-dock
    #deepin.dde-file-manager
    #deepin.dde-network-utils
    deepin.dde-polkit-agent
    deepin.dde-qt-dbus-factory
    deepin.dde-session-ui
    #deepin.deepin-anything
    deepin.deepin-desktop-base
    deepin.deepin-desktop-schemas
    deepin.deepin-gettext-tools
    deepin.deepin-gtk-theme
    deepin.deepin-icon-theme
    deepin.deepin-image-viewer
    deepin.deepin-menu
    deepin.deepin-metacity
    deepin.deepin-movie-reborn
    deepin.deepin-mutter
    deepin.deepin-shortcut-viewer
    deepin.deepin-sound-theme
    deepin.deepin-terminal
    #deepin.deepin-turbo
    deepin.deepin-wallpapers
    deepin.deepin-wm
    deepin.dpa-ext-gnomekeyring
    deepin.dtkcore
    deepin.dtkwm
    deepin.dtkwidget
    deepin.go-dbus-factory
    deepin.go-dbus-generator
    deepin.go-gir-generator
    deepin.go-lib
    deepin.qt5dxcb-plugin
    deepin.qt5integration
    #deepin.startdde
    #deepin.deepin-screenshot
  ];

  services.dbus.packages = with pkgs; [
    gnome3.dconf
    deepin.deepin-menu
  ];

  #services.gnome3.gnome-terminal-server.enable = true;

  services.xserver.enable = true;
  services.xserver.resolutions = [ { x = 1600; y = 1200; } { x = 1024; y = 768; } ];
  services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.deepin.enable = true;
  services.xserver.windowManager.fluxbox.enable = true;
  services.xserver.desktopManager.xterm.enable = true;

  services.xserver.displayManager.sessionCommands =  ''
    xrdb "${pkgs.writeText "xrdb.conf" ''
       XTerm*faceName: xft:Monospace:size=12
       XTerm*utf8: 2
    ''}"
  '';

  environment.pathsToLink = [
    "/share"
    "/bin"
    "/etc"
    "/lib"
  ];


  users.extraUsers.guest = {
    uid = 1100;
    isNormalUser = true;
    initialPassword = "g";
    extraGroups = [ "wheel" ];
  };
  users.users.root.initialPassword = "1";
}
Comment
