--- nsprpub/pr/src/misc/prtime.c.orig	Wed Feb 26 19:01:02 2003
+++ nsprpub/pr/src/misc/prtime.c	Sun Apr  6 19:22:10 2003
@@ -1666,7 +1666,7 @@
  */
 
 #if defined(SUNOS4) || (__GLIBC__ >= 2) || defined(XP_BEOS) \
-        || defined(NETBSD)
+        || defined(NETBSD) || defined(__FreeBSD__)
     a.tm_zone = NULL;
     a.tm_gmtoff = tm->tm_params.tp_gmt_offset + tm->tm_params.tp_dst_offset;
 #endif
