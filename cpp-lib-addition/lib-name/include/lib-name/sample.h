#pragma once

namespace lib_name {

class Sample {
  public:
    Sample ()                                            = default;
    Sample (const Sample &other)                         = default;  // Copy Constructor
    auto operator= (const Sample &other) -> Sample &     = default;  // Copy Assignment Operator
    Sample (Sample &&other) noexcept                     = default;  // Move Constructor
    auto operator= (Sample &&other) noexcept -> Sample & = default;  // Move Assignment Operator
    virtual ~Sample ()                                   = default;
    virtual void               setX (int /*new_value*/);
    [[nodiscard]] virtual auto getX () const -> int;

  private:
    int x_ {0};
};
}  // namespace lib_name
