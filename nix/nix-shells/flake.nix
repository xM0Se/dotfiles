{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages."aarch64-darwin";
  in
  {
    devShells."aarch64-darwin".default = pkgs.mkShell {
	
	packages =  [
		     pkgs.mcphost 
		    ]; 

 	inputsFrom = [      ]; 
    };
 };

}
