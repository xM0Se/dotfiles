{ config, lib, pkgs, ... }:

{

	imports = [ ./hardware-configuration.nix ];

	nix.settings.experimental-features = ["nix-command" "flakes"];

	boot.loader.grub.enable = true;
	boot.loader.grub.device = "/dev/sda";

	networking.hostName = "nixos"; 

	time.timeZone = "Europe/Amsterdam";

	services.xserver.xkb.layout = "us";

	users.users.xm0se = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
		packages = with pkgs; [
			tree
			git
		];
   	};

	environment.systemPackages = with pkgs; [
		vim
		git
		wget
	];

	services.openssh.enable = true;
    	services.openssh.settings.PasswordAuthentication = true;
    	services.openssh.settings.PermitRootLogin = "yes";

    	networking.firewall.enable = false;

  	system.stateVersion = "25.05";

}
