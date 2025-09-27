#include <gtest/gtest.h>      // for Message, TestInfo (ptr only), CmpHelperEQ
#include <lib-name/sample.h>  // for Sample

#include <string>             // NOLINT

namespace lib_name {
class TestSample : public ::testing::Test {
  public:
    TestSample () = default;

    Sample s;
};

TEST_F (TestSample, defaultGet) { EXPECT_EQ (s.getX (), 0); }
}  // namespace lib_name
