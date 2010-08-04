#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <test.h>

#include "const-c.inc"

MODULE = Test PACKAGE = Test PREFIX = test_
INCLUDE: const-xs.inc

Test *
test_new_int(int i)
        CODE:
                RETVAL = new_int_test(i);
        OUTPUT: RETVAL


Test *
test_new_str(char* buf)
        CODE:
                RETVAL = new_str_test(buf);
        OUTPUT: RETVAL

char *
test_get_text(Test *test)
        CODE:
                RETVAL = get_test_text(test);
        OUTPUT: RETVAL

void
test_print_text(Test *test)
        CODE:
                print_test_text(test);

MODULE = Test PACKAGE = TestPtr PREFIX = test_
void
test_DESTROY(test)
        Test *test
        CODE:
        free_test(test);
