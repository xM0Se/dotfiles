{
  description = "Dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {nixpkgs}: let
    pkgs = nixpkgs.legacyPackages."aarch64-darwin";
  in {
    devShells."aarch64-darwin".default = pkgs.mkShell {
      packages = [
        pkgs.go
        pkgs.figurine

        pkgs.uv
        pkgs.go
        pkgs.ollama
        pkgs.mcphost
      ];

      shellHook = ''

        ./.mcp-obsidian-flake-script
        #exits the
        exit

      '';
    };
  };
}
