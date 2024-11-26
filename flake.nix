{
  description = "My Templates";

  outputs = {self }: {
    templates = {
      cpp-lib = {
        path = ./cpp-lib;
        description = "A c++ library templates";
      };
    };

    templates.default = self.templates.cpp-lib;
  };
}