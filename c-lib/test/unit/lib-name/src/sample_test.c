#include <cmocka.h>
#include <lib-name/sample.h>
#include <setjmp.h>
#include <stdarg.h>
#include <stddef.h>

// TODO: Replace sample code
static void test_sample_default_get (void **state) {
    (void) state;
    sample s = {0};
    assert_int_equal (sample_get_x (&s), 0);
}

int main (void) {
    const struct CMUnitTest tests[] = {
      cmocka_unit_test (test_sample_default_get),
    };
    return cmocka_run_group_tests (tests, NULL, NULL);
}
