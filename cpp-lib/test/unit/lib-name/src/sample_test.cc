#include <gtest/gtest.h>
#include <lib-name/sample.h>

using namespace lib_name;

class TestSample : public ::testing::Test {
 public:
  TestSample() {}

  Sample s{};
};

TEST_F(TestSample, default_get) { EXPECT_EQ(s.GetX(), 0); }