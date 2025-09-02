{ pkgs, ... }:
{
home.packages = with pkgs; [
	rofi-wayland
]; 

home.file = { 
	".config/rofi/config.rasi".source = ../rofi/config.rasi;
	".config/rofi/nord.rasi".source = ../rofi/nord.rasi; 
}; 
}

