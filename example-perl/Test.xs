#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <test.h>

#include "const-c.inc"

MODULE = Test		PACKAGE = Test
INCLUDE: const-xs.inc

