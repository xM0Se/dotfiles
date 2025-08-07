#{ nixpkgs, lib, config, ... }: {
#
#options =  {
#  module1.enable =
#};
#
#config = {
#  option1 = 5;
#  option2 = true;
#};
#
#    environment.systemPackages =
#    [
#    nixpkgs.btop
#    ];
#
#}


#{ lib, config, options, nixpkgs, ... }: {
#
#  options = {
#     You can define custom module options here if needed
#    module1.enable = lib.mkOption {
#      type = lib.types.bool;
#      default = false;
#      description = "Enable module1.";
#    };
#  };
#
#  config = {
#    option1 = 5;
#    option2 = true;
#
#    This must be inside the config block
#    environment.systemPackages = [
#      nixpkgs.btop
#    ];
#  };
#
#}
#
#
# module1.nix

{ pkgs, lib, config, ... }: {

  options = {
    module1.enable = 
      lib.mkEnableOption "enables module1";
  };

  config = lib.mkIf config.module1.enable {
    option1 = 5;
    option2 = true;
  };

}


