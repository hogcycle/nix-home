# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
   # temp patch for tailscale to work
    boot.kernelPatches = [
      # Fix the /proc/net/tcp seek issue
      # Impacts tailscale: https://github.com/tailscale/tailscale/issues/16966
      {
        name = "proc: fix missing pde_set_flags() for net proc files";
        patch = pkgs.fetchurl {
          name = "fix-missing-pde_set_flags-for-net-proc-files.patch";
          url = "https://patchwork.kernel.org/project/linux-fsdevel/patch/20250821105806.1453833-1-wangzijie1@honor.com/raw/";
          hash = "sha256-DbQ8FiRj65B28zP0xxg6LvW5ocEH8AHOqaRbYZOTDXg=";
        };
      }
    ];
  imports = [
      ./hardware-configuration.nix
  ];
  nix = { 
	settings = { 
		experimental-features = ["nix-command" "flakes" ];
	}; 
  }; 
  environment.systemPackages = with pkgs; [ 
	neovim
	git
	wget
	acpi
	curl
  ]; 
  environment.sessionVariables = { 
	GTK_THEME = "Adwaita:dark"; 
	NIXOS_OZONE_WL = "1"; 
  };  
  hardware = { 
	graphics.enable = true; 
  };
  fonts = {
      fontconfig = {
        enable = true; 
	defaultFonts = {
	  monospace = [ "JetBrainsMono Nerd Font Mono" "JetBrains Mono" ]; 
        }; 
      }; 
      packages = with pkgs; [
	nerd-fonts.jetbrains-mono
	nerd-fonts.fira-code
      ]; 
  }; 
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config = {
      hyprland = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [
          "gnome"
        ];
      };
    };
  };
  security.rtkit.enable = true; 
  services.pipewire = { 
	enable = true; 
	alsa.enable = true; 
	alsa.support32Bit = true; 
	pulse.enable = true; 
	jack.enable = true; 
  };  
 
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "x1nano"; # Define your hostname.
  networking.networkmanager.enable = true;  

  time.timeZone = "America/New_York";
  services.tailscale.enable = true; 
  users.users.nate = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user
    shell = pkgs.zsh; 
  };
  hardware.bluetooth = { 
	enable = true;
	powerOnBoot = true; 
	settings = { 
		General = { 
			Experimental = true; 
		}; 
	}; 
  }; 
  programs.steam.enable = true; 
  programs.zsh.enable = true; 
  services.blueman.enable = true; 
  services.tlp.enable = true;
  services.thermald.enable = true; 

  system.stateVersion = "25.05"; # Did you read the comment?
  nixpkgs.config.allowUnfree = true; 

}

