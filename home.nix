{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland.nix
    ./modules/zsh.nix
    ./modules/kanshi.nix
    ./modules/waybar.nix
  ]; 
  home.username = "nate";
  home.homeDirectory = "/home/nate";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  fonts.fontconfig.enable = true; 
  home.packages = with pkgs; [
	hyprland
	kanshi
	kitty
	rofi	
	clipse
	superfile
	btop
	pamixer
	brightnessctl
	font-awesome
	nerd-fonts.fira-code
	nerd-fonts.jetbrains-mono
  ];
 
  xdg.portal.enable = true; 
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk 
    pkgs.xdg-desktop-portal-hyprland
  ]; 

  programs.kitty.enable = true; 
  programs.home-manager.enable = true;
  services.swww.enable = true; 
}

