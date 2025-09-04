{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland.nix
    ./modules/zsh.nix
    ./modules/kanshi.nix
    ./modules/waybar.nix
    ./modules/rofi.nix
    ./modules/kitty.nix
    ./modules/superfile.nix
  ]; 
  home.username = "nate";
  home.homeDirectory = "/home/nate";
  home.packages = with pkgs; [
	hyprland
	hyprlock
	swww
	dunst
	libnotify
	swaynotificationcenter
	kanshi
	clipse
	btop
	pamixer
	brightnessctl
	font-awesome
	nerd-fonts.fira-code
	nerd-fonts.jetbrains-mono
	calcure
	firefox
	thunderbird
	neovim
	discord
	plex-desktop
	plexamp
	vscode
	ffmpeg
	nodejs
	obsidian
	wl-clipboard
	(flameshot.override { enableWlrSupport = true; })
  ];
  home.sessionVariables = { 
    GTK_THEME = "Adwaita:dark"; 
    NIXOS_OZONE_WL = "1"; 
  };
  # -- Programs and services -- 
  xdg.portal.enable = true; 
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk 
    pkgs.xdg-desktop-portal-hyprland
  ]; 
  programs.home-manager.enable = true;
  services.swww.enable = true; 
  services.ssh-agent.enable = true; 
  fonts.fontconfig.enable = true; 
 

  home.stateVersion = "25.05"; 
}

