
$FreeBSD: ports/www/mozilla/files/patch-modules::libpref::src::unix::unix.js,v 1.5 2003/04/04 07:04:20 marcus Exp $

--- modules/libpref/src/unix/unix.js	2002/03/14 15:04:20	1.1
+++ modules/libpref/src/unix/unix.js	2002/03/14 15:04:38
@@ -227,7 +227,7 @@
 
 // TrueType
 pref("font.FreeType2.enable", false);
-pref("font.freetype2.shared-library", "libfreetype.so.6");
+pref("font.freetype2.shared-library", "libfreetype.so.9");
 // if libfreetype was built without hinting compiled in
 // it is best to leave hinting off
 pref("font.FreeType2.autohinted", false);
