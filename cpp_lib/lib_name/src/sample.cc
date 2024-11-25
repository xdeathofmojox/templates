#include "lib_name/sample.h"

namespace lib_name {
    void Sample::SetX(const int new_value) {
        x = new_value;
    }

    int Sample::GetX() const {
        return x;
    }
} // namespace lib_name