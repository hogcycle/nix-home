{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland.nix
    ./modules/kanshi.nix
  ]; 
  home.username = "nate";
  home.homeDirectory = "/home/nate";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
	hyprland
	kanshi
	kitty
	rofi	
	clipse
	superfile
  ];
 
 gtk = {
  enable = true;
  theme = {
    name = "Adwaita-dark";
    package = pkgs.gnome-themes-extra;
  };
  gtk3.extraConfig = {
    gtk-application-prefer-dark-theme = 1;
  };
  gtk4.extraConfig = {
    gtk-application-prefer-dark-theme = 1;
  };
};

qt = {
  enable = true;
  platformTheme.name = "gtk";
};
  xdg.portal.enable = true; 
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk 
    pkgs.xdg-desktop-portal-hyprland
  ]; 

  programs.kitty.enable = true; 
  programs.home-manager.enable = true;
}

