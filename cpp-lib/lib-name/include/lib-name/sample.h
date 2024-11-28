#pragma once

namespace lib_name {
class Sample {
 public:
  Sample() = default;
  virtual ~Sample() = default;
  virtual void SetX(const int);
  virtual int GetX() const;

 private:
  int x;
};
}  // namespace lib_name