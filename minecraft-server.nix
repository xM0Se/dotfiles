{
	self,
	pkgs,
	...
}: {

	imports = [
		./hosts/nix-os/servers/minecraft-server/configuration.nix
	];

	nixpkgs.hostPlatform = "x86_64-linux";	
	nixpkgs.config.allowUnfree = true;
environment.systemPackages = [
  (self.packages.${pkgs.system}.nvimconf)
];

}
