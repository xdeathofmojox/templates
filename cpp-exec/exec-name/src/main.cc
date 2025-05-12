#include <__ostream/basic_ostream.h>
#include <iostream>
#include <string_view>
#include "exec-name/sample.h"

auto main () -> int {
    std::cout << exec_name::kHelloWorld << "\n";
    return 0;
}
