--- autogen.sh.orig	Mon Mar 25 07:41:49 2002
+++ autogen.sh	Mon Mar 24 15:53:30 2003
@@ -10,20 +10,20 @@
 
 set -e
 
-automake --version | perl -ne 'if (/\(GNU automake\) ([0-9].[0-9])/) {print;  if ($1 < 1.4) {exit 1;}}'
+%%AUTOMAKE%% --version | perl -ne 'if (/\(GNU automake\) ([0-9].[0-9])/) {print;  if ($1 < 1.4) {exit 1;}}'
 
 if [ $? -ne 0 ]; then
     echo "Error: you need automake 1.4 or later.  Please upgrade."
     exit 1
 fi
 
-if test ! -d `aclocal --print-ac-dir`; then
+if test ! -d `%%ACLOCAL%% --print-ac-dir`; then
   echo "Bad aclocal (automake) installation"
   exit 1
 fi
 
 for script in `cd ac-helpers/fallback; echo *.m4`; do
-  if test -r `aclocal --print-ac-dir`/$script; then
+  if test -r `%%ACLOCAL%% --print-ac-dir`/$script; then
     # Perhaps it was installed recently
     rm -f ac-helpers/$script
   else
@@ -34,13 +34,13 @@
 
 # Produce aclocal.m4, so autoconf gets the automake macros it needs
 echo "Creating aclocal.m4..."
-aclocal -I ac-helpers
+%%ACLOCAL%% -I ac-helpers
 
 # autoheader
 
 # Produce all the `GNUmakefile.in's and create neat missing things
 # like `install-sh', etc.
-automake --add-missing --copy --foreign
+%%AUTOMAKE%% --add-missing --copy --foreign
 
 # If there's a config.cache file, we may need to delete it.  
 # If we have an existing configure script, save a copy for comparison.
@@ -50,7 +50,7 @@
 
 # Produce ./configure
 echo "Creating configure..."
-autoconf
+%%AUTOCONF%%
 
 echo ""
 echo "You can run ./configure now."
