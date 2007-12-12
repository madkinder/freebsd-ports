--- calendar/libical/src/libical/icaltz-util.c.orig	2007-10-12 02:31:10.000000000 -0400
+++ calendar/libical/src/libical/icaltz-util.c	2007-11-03 12:22:24.000000000 -0400
@@ -23,6 +23,15 @@
 #include <string.h>
 #if defined(sun) && defined(__SVR4)
 #include <sys/byteorder.h>
+#elif defined(__FreeBSD__)
+#include <sys/endian.h>
+#define __BYTE_ORDER            _BYTE_ORDER
+#define __LITTLE_ENDIAN         _LITTLE_ENDIAN
+#define __BIG_ENDIAN            _BIG_ENDIAN
+
+#define bswap_16                bswap16
+#define bswap_32                bswap32
+#define bswap_64                bswap64
 #else
 #include <byteswap.h>
 #include <endian.h>
