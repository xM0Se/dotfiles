{lib, ...}: {
  options.custom = {
    hostPath = lib.mkOption {
      type = lib.types.path;
      description = "Host-specific base path.";
    };
  };
}
