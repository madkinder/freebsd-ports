--- platform.h	2009-01-20 09:51:39.000000000 -0500
+++ platform.h	2009-01-20 09:51:58.000000000 -0500
@@ -11,7 +11,7 @@
 // http://predef.sourceforge.net/prearch.html , these ought to work on
 // gcc, Sun Studio and Visual Studio.
 // Throw in ia64 as well, though I doubt anyone will play EL on that.
-#if defined (__x86_64__) || defined (_M_X64) || defined (__ia64__) || defined (_M_IA64)
+#if defined (__x86_64__) || defined (_M_X64) || defined (__ia64__) || defined (_M_IA64) || defined (__amd64__)
  #define X86_64
 #endif
 
