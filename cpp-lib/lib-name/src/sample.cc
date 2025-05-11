#include "lib-name/sample.h"

namespace lib_name {
void Sample::setX (const int new_value) { x_ = new_value; }

auto Sample::getX () const -> int { return x_; }
}  // namespace lib_name
