--- tnftpd.h-orig	Wed Dec 17 02:43:41 2003
+++ tnftpd.h	Tue Feb  3 18:14:15 2004
@@ -429,5 +429,9 @@
 #define TM_YEAR_BASE	1900
 
 #if ! defined(LOGIN_NAME_MAX)
+#if defined(MAXLOGNAME)
+# define LOGIN_NAME_MAX MAXLOGNAME
+#elif ! defined(LOGIN_NAME_MAX)
 # define LOGIN_NAME_MAX (9)
+#endif
 #endif
