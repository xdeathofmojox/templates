{
  description = "My Templates";

  outputs = {self }: {
    templates = {
      c-exec = {
        path = ./c-exec;
        description = "A c executable template";
      };

      c-lib = {
        path = ./c-lib;
        description = "A c library template";
      };
      
      cpp-exec = {
        path = ./cpp-exec;
        description = "A c++ executable template";
      };

      cpp-exec-additon = {
        path = ./cpp-exec-addition;
        description = "A c++ executable to add into an existing project";
      };

      cpp-lib = {
        path = ./cpp-lib;
        description = "A c++ library template";
      };

      cpp-lib-addition = {
        path = ./cpp-lib-addition;
        description = "A c++ library to add into an existing project";
      };

      rust-cargo-crate = {
        path = ./rust-cargo-crate;
        description = "A rust cargo crate template";
      };

      rust-cargo-workspace = {
        path = ./rust-cargo-workspace;
        description = "A rust cargo workspace template";
      };

      zig-exec = {
        path = ./zig-exec;
        description = "A zig executable template";
      };

      zig-lib = {
        path = ./zig-lib;
        description = "A zig library template";
      };
    };

    templates.default = self.templates.cpp-lib;
  };
}