{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland.nix
    ./kanshi.nix
  ]
  home.username = "nate";
  home.homeDirectory = "/home/nate";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
	hyprland
	kanshi
	kitty
	rofi	
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
 services.kanshi = { 
	enable = true;  
    profiles = {
      docked = {
        outputs = [
          { criteria = "eDP-1"; 
			status = "disable"; 
		  }
          { criteria = "DP-7"; 
			status = "enable";
			mode = "3840x2160@60Hz"; 
			position = "0,0"; 
			scale = 1.5; }
        ];
      };
      laptop = {
        outputs = [
          { criteria = "eDP-1";
			 status = "enable";
			 mode = "2160x1350@59.74Hz";
			 position = "0,0";
			 scale = 1.5;
			 }
          { criteria = "DP-7";
			 status = "disable"; }
        ];
      };

      default = {
        outputs = [
          { criteria = "eDP-1";
			 status = "enable";
			 #mode = "2160x1350@59.74Hz";
			 position = "0,0";
			 scale = 1.5; }
        ];
      };
    };
  };	
  xdg.portal.enable = true; 
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-gtk 
    pkgs.xdg-desktop-portal-hyprland
  ]; 

  programs.kitty.enable = true; 
  programs.home-manager.enable = true;
}

