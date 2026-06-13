{
  inputs,
  self,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops = {
    defaultSopsFile = "${self}/secrets/secrets.yaml";
    defaultSopsFormat = "yaml";
    gnupg.sshKeyPaths = [];
    age.keyFile = "/etc/sops.age.key";
  };
}
