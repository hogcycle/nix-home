{ pkgs, ... }: {
  services.kanshi = { 
	enable = true;  
	systemdTarget = "hyprland-session.target"; 
	settings = [
	  {
	      profile.name = "docked";
	      profile.outputs = [
	      	{
		criteria = "eDP-1"; 
		status = "disable";
		} 
		{
		criteria = "DP-8"; 
		status = "enable"; 
		} 
	      ]; 
	      # profile.exec = "[ ${pkgs.bash}/bin/bash /home/nate/.config/home-manager/hypr/dock.sh ]"; 
	  } 
	  {
	      profile.name = "undocked";
	      profile.outputs = [
                  { 
		  criteria = "eDP-1";
		  status = "enable"; 
		  } 
		  {
		  criteria = "DP-8"; 
		  status = "disable"; 
		  position = "0,0";  
		  } 
	      ]; 
	      # profile.exec = "[ ${pkgs.bash}/bin/bash /home/nate/.config/home-manager/hypr/undock.sh ]"; 
	  } 
	]; 
    };
  }	
