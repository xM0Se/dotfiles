{lib, ...}: {
  options.zen.profile = lib.mkOption {
    type = lib.types.str;
    default = "default";
    description = "The Profile of zen browser till now only supports one";
  };
}
