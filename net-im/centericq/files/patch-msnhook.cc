--- src/hooks/msnhook.cc	Mon Oct 28 19:29:41 2002
+++ src/hooks/msnhook.cc	Tue Nov 26 16:10:34 2002
@@ -30,6 +30,7 @@
 #include "eventmanager.h"
 #include "centericq.h"
 #include "imlogger.h"
+#include "utf8conv.h"
 
 msnhook mhook;
 
@@ -159,7 +160,8 @@
     }
 
     icqcontact *c = clist.get(ev.getcontact());
-    text = siconv(text, conf.getrussian() ? "koi8-u" : DEFAULT_CHARSET, "utf8");
+    text = StrToUtf8(text);
+//    text = siconv(text, conf.getrussian() ? "koi8-u" : DEFAULT_CHARSET, "utf8");
 //    text = toutf8(rusconv("kw", text));
 
     if(c)
@@ -274,8 +276,8 @@
 	m.homepage = "http://members.msn.com/" + b.email;
 
 	if(!friendlynicks[ic.nickname].empty()) {
-	    c->setdispnick(friendlynicks[ic.nickname]);
-	    b.fname = friendlynicks[ic.nickname];
+	    c->setdispnick(Utf8ToStr(friendlynicks[ic.nickname]));
+	    b.fname = Utf8ToStr(friendlynicks[ic.nickname]);
 	}
 
 	c->setbasicinfo(b);
@@ -371,7 +373,8 @@
 	}
 
 //        text = rusconv("wk", fromutf8(d->msg));
-	text = siconv(d->msg, "utf8", conf.getrussian() ? "koi8-u" : DEFAULT_CHARSET);
+//	text = siconv(d->msg, "utf8", conf.getrussian() ? "koi8-u" : DEFAULT_CHARSET);
+	text = Utf8ToStr(d->msg);
 	em.store(immessage(ic, imevent::incoming, text));
 
 	if(c)
@@ -453,3 +456,136 @@
 	clist.get(contactroot)->playsound(imevent::email);
     }
 }
+#if HAVE_ICONV_H
+int safe_iconv( iconv_t handle, const char **inbuf, size_t *inbytesleft,
+	     char **outbuf, size_t *outbytesleft)
+{
+    int ret;
+    while (*inbytesleft) {
+	 ret = iconv( handle, inbuf, inbytesleft,
+		outbuf, outbytesleft);
+	if (!*inbytesleft || !*outbytesleft)
+	    return ret;
+	/*got invalid seq - so replace it with '?' */
+	**outbuf = '?'; (*outbuf)++; (*outbytesleft)--;
+	(*inbuf)++; (*inbytesleft)--;
+    }
+    return ret;
+}
+
+const char* guess_current_locale_charset()
+{
+    char *lang, *ch;
+    /* Return previously learned charset */
+    if (loc_charset[0])
+	return loc_charset;
+
+    lang = getenv("LANG");
+    if (!lang) {
+	strcpy( loc_charset, DEFAULT_CHARSET );
+	return loc_charset;
+    };
+    ch = strrchr( lang, '.' );
+    if (!ch)
+	strcpy( loc_charset, DEFAULT_CHARSET );
+    else {
+	iconv_t pt;
+	ch++;
+	strncpy( loc_charset, ch, sizeof(loc_charset) );
+	/* try to open iconv handle using guessed charset */
+	if ( (pt = iconv_open( loc_charset, loc_charset )) == (iconv_t)(-1) )
+	{
+	    strcpy( loc_charset, DEFAULT_CHARSET );
+	} else {
+	    iconv_close(pt);
+	};
+	
+    }
+
+    return loc_charset;
+}
+
+char *StrToUtf8( const char *inbuf )
+{
+    size_t length = strlen( inbuf );
+    size_t outmaxlength = UTF8_BUF_LENGTH;
+    char *outbuf = utf8_buf;
+    char *outbuf_save = outbuf;
+    int ret;
+
+    iconv_t handle = iconv_open( "utf-8", guess_current_locale_charset() );
+    if(((int) handle) != -1) {
+	ret = safe_iconv( handle, (const char **) &inbuf, &length, &outbuf, &outmaxlength );
+    
+	*outbuf = '\0';
+	iconv_close( handle );
+	return outbuf_save;
+    } else {
+	return (char *)inbuf;
+    };
+}
+ 
+std::string StrToUtf8( const std::string &instr )
+{
+    size_t length = instr.length();
+    size_t outmaxlength = UTF8_BUF_LENGTH;
+    const char *inbuf = instr.c_str();
+    char *outbuf = utf8_buf;
+    char *outbuf_save = outbuf;
+    int ret;
+
+    iconv_t handle = iconv_open( "utf-8", guess_current_locale_charset() );
+    if(((int) handle) != -1) {
+	ret = safe_iconv( handle, (const char **) &inbuf, &length, &outbuf, &outmaxlength );
+    
+	*outbuf = '\0';
+	iconv_close( handle );
+
+	std::string return_me = outbuf_save;
+	return return_me;
+    } else {
+	return instr;
+    };
+}
+ 
+char *Utf8ToStr( const char *inbuf )
+{
+    size_t length = strlen( inbuf );
+    size_t outmaxlength = UTF8_BUF_LENGTH / 4;
+    char *outbuf = utf8_buf;
+    char *outbuf_save = outbuf;
+    int ret;
+
+    iconv_t handle = iconv_open( guess_current_locale_charset(), "utf-8" );
+    if(((int) handle) != -1) {
+	ret = safe_iconv( handle, (const char **) &inbuf, &length, &outbuf, &outmaxlength );
+	*outbuf = '\0';
+	iconv_close( handle );
+	return outbuf_save;
+    } else {
+	return (char *)inbuf;
+    };
+}
+
+std::string Utf8ToStr( const std::string &instr )
+{
+    size_t length = instr.length();
+    const char *inbuf = instr.c_str();
+    size_t outmaxlength = UTF8_BUF_LENGTH / 4;
+    char *outbuf = utf8_buf;
+    char *outbuf_save = outbuf;
+    int ret;
+
+    iconv_t handle = iconv_open( guess_current_locale_charset(), "utf-8" );
+
+    if(((int) handle) != -1) {
+	ret = safe_iconv( handle, (const char **) &inbuf, &length, &outbuf, &outmaxlength );
+	*outbuf = '\0';
+	iconv_close( handle );
+	std::string return_me = outbuf_save;
+	return return_me;
+    } else {
+	return instr;
+    };
+}
+#endif /* HAVE_ICONV_H */
