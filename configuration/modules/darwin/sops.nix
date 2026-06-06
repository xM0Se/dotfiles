{inputs, ...}: {
  imports = [inputs.sops-nix.darwinModules.sops];
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/Users/xm0se/.config/sops/age/keys.txt";
  };
}
