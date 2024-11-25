{
  description = "My Templates";

  outputs = {self }: {
    templates = {
      cpp_lib = {
        path = ./cpp_lib;
        description = "A c++ library templates";
      };
    };

    templates.default = self.templates.cpp_lib;
  };
}