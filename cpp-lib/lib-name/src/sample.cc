#include "lib-name/sample.h"

namespace lib_name {
void Sample::SetX (const int new_value) { x = new_value; }

auto Sample::GetX () const -> int { return x; }
}  // namespace lib_name
