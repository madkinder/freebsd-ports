--- stats.sh.orig	Thu Jul 13 11:50:02 2006
+++ stats.sh	Thu Jul 13 11:55:05 2006
@@ -4,12 +4,12 @@
 # copy of your standard Unix shell, the 'tail' utility and a working 'awk'
 # interpreter.
 
-# I use the default location for ASSP's maillog file, and the 'maillog.log'
+# I use the default location for ASSP's maillog file, and the 'maillog.txt'
 # name (in assp.cfg) to keep ASSP from changing it on me.
 
-# This script attempts to go back at least 300 lines in your maillog.log
+# This script attempts to go back at least 300 lines in your maillog.txt
 # file to give you a nice screenful of goodies to review when it
-# first starts.  If your maillog.log is nearly empty, then just
+# first starts.  If your maillog.txt is nearly empty, then just
 # be patient. As things happen - the logger will reveal it in COLOR!
 # ------------------------------------ KRL -------------------------
 
@@ -30,8 +30,11 @@
 # BS (in Red) lines are those caught by the Bayesian filter !!
 # LW (in White .. mostly) are those Local or Whitelisted eMails
 # Ok (in Green) are eMail that fully pass alltests without exceptions.
-# RB (in Cyan) .. Blocked Relay attempt
-# WL+  Whitelist ADDITION by an authorized local user
+# RB (in Magenta) .. Blocked Relay attempt
+# HL (in Magenta) .. Blocked due to spam HELO
+# SP (in Magenta) .. Blocked by failed SPF lookup
+# WA+  Whitelist ADDITION by an authorized local user
+# WL+  Whitelist ADDITION of address CC'd in whitelisted email
 # BA (in Cyan) .. Bad ATTACHEMENT rejected
 # SR (in Cyan) .. spam@ report submission
 # NS (in Cyan) .. notspam@ report submission
@@ -46,91 +49,144 @@
 # Some fields are truncated (with a hard-coded length value, usually 40)
 #   to keep each line more or less intact on your screen as things scroll by
 # Colors are coded with ANSI Color coding, your mileage may vary ...
-# I assume the naming convention of 'maillog.log' so ASSP won't munge
+# I assume the naming convention of 'maillog.txt' so ASSP won't munge
 #  each current log into some difficult-to-grok name.  You should try
 #  to use this feature - and perhaps roll the log periodically with
 #  your system's 'newsyslog' functionality. You can send a SIGHUP to
 #  ASSP when you roll the log so it starts afresh..KRL
 
-tail -300 -f /usr/local/assp/maillog.log | \
+tail -300 -f /var/db/assp/maillog.txt | \
  awk  ' \
-  /whitelisted/ { \
-  printf("%s %s \033[1;32m%-15s L\033[0mW  %s \033[1;32m->\033[0m %s\n", \
-        substr($1,1,length($1)), \
-        substr($2,1,length($2)), \
-        substr($3,1,length($3)), \
-        substr($4,1,40), \
-        substr($6,1,length($6)) )\
-        } \
-  /email/ && /whitelist addition/ { \
-  printf("%s %s \033[1;32m%-15s W\033[0mA+ %s \033[1;32m->\033[0m %s\n", \
-        substr($1,1,length($1)), \
-        substr($2,1,length($2)), \
-        "+email address+", \
+  /local or whitelisted/ { \
+  printf("%s %s \033[1;32m%-15s\033[0m \033[1;37mLW  %s\033[0m \033[1;32m->\033[0m \033[1;37m%s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
         substr($4,1,40), \
-        substr($6,1,length($6)) )\
+        $6 )\
+        } \
+  /Email whitelist addition/ { \
+  printf("%s %s \033[1;36m%-15s WA+ %s\033[0m \033[1;37m%s\033[0m\n", \
+        $1, \
+        $2, \
+        "+email address+", \
+        "-adds-", \
+        $6 )\
         } \
-  /whitelist addition/ && !/email/ { \
-  printf("%s %s \033[1;32m%-15s W\033[0mL+ %s \033[1;32m %s %s\033[0m\n", \
-        substr($1,1,length($1)), \
-        substr($2,1,length($2)), \
-        substr($3,1,length($3)), \
+  /whitelist addition:/ && !/[Ee]mail/ { \
+  printf("%s %s \033[1;32m%-15s\033[0m \033[1;37mWL+ %s\033[0m \033[1;32m%s\033[0m \033[1;37m%s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
         substr($4,1,40), \
         "-adds-", \
-        substr($9,1,length($9)) )\
+        $9 )\
         } \
-  /Bayesian spam/ { \
+  /Bayesian [Ss]pam/ { \
   printf("%s %s \033[1;31m%-15s BS  %s -> %s\033[0m\n", \
-          substr($1,1,length($1)), \
-          substr($2,1,length($2)), \
-          substr($3,1,length($3)), \
-          substr($4,1,40), \
-        substr($6,1,length($6)) )\
+        $1, \
+        $2, \
+        $3, \
+        substr($4,1,40), \
+        $6 )\
         } \
   /message ok/ { \
   printf("%s %s \033[1;32m%-15s Ok  %s -> %s\033[0m\n", \
-        substr($1,1,length($1)), \
-        substr($2,1,length($2)), \
-        substr($3,1,length($3)), \
+        $1, \
+        $2, \
+        $3, \
         substr($4,1,40), \
-        substr($6,1,length($6)) )\
+        $6 )\
         } \
-  /bad attachment/ { \
+  /bad attachment/ && !/no bad/ { \
         printf("%s %s \033[1;35m%-15s BA  %s -> %s\033[0m\n", \
-        substr($1,1,length($1)), \
-        substr($2,1,length($2)), \
-        substr($3,1,length($3)), \
+        $1, \
+        $2, \
+        $3, \
         substr($4,1,40), \
-        substr($6,1,length($6)) )\
+        $6 )\
         } \
   /relay attempt blocked/ { \
-        printf("%s %s \033[1;35m%-15s RB  %s -> %s %s %s %s %s\033[0m\n", \
-        substr($1,1,length($1)), \
-        substr($2,1,length($2)), \
-        substr($3,1,length($3)), \
-        substr($4,1,length($4)), \
-        substr($5,1,length($5)), \
-        substr($6,1,length($6)), \
-        substr($7,1,length($7)), \
-        substr($8,1,length($8)), \
-        substr($9,1,length($9)) )\
-        } \
-  /Admin update:/ { \
-  printf("\033[1;33m%s %s %s %s %s %s \033[0m\n", $1, $2, $3, $4, $5, $6) \
-        } \
-  /Email spamreport/ { \
-  printf("%s %s\033[0;36m %-15s SR  %s Email SPAM Submission\033[0m\n", \
-        substr($1,1,length($1)), \
-        substr($2,1,length($2)), \
-        substr($3,1,length($3)), \
-        substr($4,1,length($4)) ) \
-        } \
-  /Email hamreport/ { \
-  printf("%s %s\033[0;36m %-15s NS  %s Email NOTSPAM Submission\033[0m\n", \
-        substr($1,1,length($1)), \
-        substr($2,1,length($2)), \
-        substr($3,1,length($3)), \
-        substr($4,1,length($4)) ) \
+        printf("%s %s \033[1;35m%-15s RB  %s -> %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        substr($4,1,40), \
+        ($9 ~ /^(.*):$/) ? $10 : $9 )\
+        } \
+  /[Ii]nvalid address rejected/ { \
+  printf("%s %s \033[1;34m%-15s IR  %s -> %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        substr($4,1,40), \
+        $NF )\
+        } \
+  /malformed address/ { \
+  printf("%s %s \033[1;35m%-15s MA  %s -> %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        substr($4,1,40), \
+        $7 )\
+        } \
+  /failed RBL checks|Received-RBL: fail/ { \
+  printf("%s %s \033[1;35m%-15s BL  %s -> %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        substr($4,1,40), \
+        $6 )\
+        } \
+  /failed SPF checks|Received-SPF: fail/ { \
+  printf("%s %s \033[1;35m%-15s SP  %s -> %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        substr($4,1,40), \
+        $6 )\
+        } \
+  /has spam helo/ { \
+  printf("%s %s \033[1;35m%-15s HL  %s -> %s %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        substr($4,1,40), \
+        $6, \
+        $10 )\
+        } \
+  /Sender Validation:blocked:/ { \
+  printf("%s %s \033[1;35m%-15s HL  %s %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        substr($4,1,40), \
+        $9 )\
+        } \
+  /recipient delayed/ { \
+  printf("%s %s \033[1;35m%-15s DL  %s -> %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        substr($4,1,40), \
+        $7 ) \
+        } \
+  /Admin (update:|connection from )/ { \
+  printf("\033[1;33m%s\033[0m\n", $0) \
+        } \
+  /[Ee]mail spamreport/ { \
+  printf("%s %s\033[1;36m %-15s SR  %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        $4 ) \
+        } \
+  /[Ee]mail hamreport/ { \
+  printf("%s %s\033[1;36m %-15s NS  %s\033[0m\n", \
+        $1, \
+        $2, \
+        $3, \
+        $4 ) \
  }'
 # end of script
 
