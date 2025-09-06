{ pkgs, ... }: {
  xdg.configFile = { 
	"hypr/docked.sh".source = ../hypr/docked.sh; 
	"hypr/undocked.sh".source = ../hypr/undocked.sh; 
  }; 
  services.kanshi = {
  enable = true;
  systemdTarget = "hyprland-session.target"; 
  profiles = { 
  	undocked = { 
  		exec = [ "${pkgs.bash}/bin/bash /home/nate/.config/hypr/undocked.sh" ]; 
  		outputs = [
  		{
  			criteria = "eDP-1"; 
  			status = "enable"; 
  			mode = "2160x1350@59.74400Hz";
  		}
  		]; 
  	}; 
  	docked = {
  		exec = [ "${pkgs.bash}/bin/bash /home/nate/.config/hypr/docked.sh" ]; 
  		outputs = [
  		{
  		#	criteria = "Sceptre Tech Inc Sceptre Z27 Unknown"; 
  			criteria = "DP-8";
  			status = "enable"; 
  		}
  		{
  			criteria = "eDP-1"; 
  			status = "disable"; 
  		} 
  		]; 
    };
  };
 }; 
}
