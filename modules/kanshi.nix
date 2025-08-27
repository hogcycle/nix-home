{ ... }: {
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
}
