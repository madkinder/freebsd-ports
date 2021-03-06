--- base/iconv.cc.org	2010-11-06 10:43:30.936188326 +0900
+++ base/iconv.cc	2010-11-06 11:22:34.282186490 +0900
@@ -52,7 +52,11 @@
   size_t olen_org = olen;
   iconv(ic, 0, &ilen, 0, &olen);  // reset iconv state
   while (ilen != 0) {
+#ifdef __FreeBSD__
+    if (iconv(ic, (const char **)(&ibuf), &ilen, &obuf, &olen)
+#else
     if (iconv(ic, reinterpret_cast<char **>(&ibuf), &ilen, &obuf, &olen)
+#endif
         == static_cast<size_t>(-1)) {
       return;
     }
