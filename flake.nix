{
  description = "My Templates";

  outputs = {self }: {
    templates = {
      cpp-lib = {
        path = ./cpp-lib;
        description = "A c++ library template";
      };

      cpp-exec = {
        path = ./cpp-exec;
        description = "A c++ executable template";
      };

      rust-cargo-workspace = {
        path = ./rust-cargo-workspace;
        description = "A rust cargo workspace";
      };
    };

    templates.default = self.templates.cpp-lib;
  };
}