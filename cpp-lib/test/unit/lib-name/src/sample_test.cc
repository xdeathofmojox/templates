#include <gtest/gtest.h>
#include <lib-name/sample.h>

namespace lib_name {
class TestSample : public ::testing::Test {
  public:
    TestSample () = default;

    Sample s;
};

TEST_F (TestSample, defaultGet) { EXPECT_EQ (s.getX (), 0); }
}  // namespace lib_name
