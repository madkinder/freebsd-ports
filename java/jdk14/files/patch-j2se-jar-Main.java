$FreeBSD$

--- ../../j2se/src/share/classes/sun/tools/jar/Main.java	22 Oct 2003 23:02:47 -0000	1.1.1.2
+++ ../../j2se/src/share/classes/sun/tools/jar/Main.java	27 Apr 2005 05:01:42 -0000
@@ -32,6 +32,7 @@
     Hashtable filesTable = new Hashtable();
     Vector paths = new Vector();
     Vector v;
+    String cwd;
     CRC32 crc32 = new CRC32();
     /* cflag: create
      * uflag: update       
@@ -671,6 +672,19 @@
      * Extracts specified entries from JAR file.
      */
     void extract(InputStream in, String files[]) throws IOException {
+    	// Current working directory
+
+	cwd = System.getProperty("user.dir");
+	if (cwd == null) {
+            fatalError(getMsg("error.no.cwd"));
+	}
+	cwd = (new File(cwd)).getCanonicalPath();
+	if (!cwd.endsWith(File.separator)) {
+	    cwd += File.separator;
+	}
+
+	// Extract the files
+
 	ZipInputStream zis = new ZipInputStream(in);
 	ZipEntry e;
 	while ((e = zis.getNextEntry()) != null) {
@@ -695,6 +709,10 @@
     void extractFile(ZipInputStream zis, ZipEntry e) throws IOException {
         String name = e.getName();
 	File f = new File(e.getName().replace('/', File.separatorChar));
+	if (!f.getCanonicalPath().startsWith(cwd)) {
+ 	    output(formatMsg("out.ignore.entry", name));
+	    return;
+	}
 	if (e.isDirectory()) {
 	    if (!f.exists() && !f.mkdirs() || !f.isDirectory()) {
 		throw new IOException(formatMsg("error.create.dir", f.getPath()));
@@ -705,6 +723,10 @@
 	} else {
 	    if (f.getParent() != null) {
 		File d = new File(f.getParent());
+		if (!d.getCanonicalPath().startsWith(cwd)) {
+	 	    output(formatMsg("out.ignore.entry", name));
+		    return;
+		}
 		if (!d.exists() && !d.mkdirs() || !d.isDirectory()) {
 		    throw new IOException(formatMsg("error.create.dir", d.getPath()));
 		}
Index: j2se/src/share/classes/sun/tools/jar/resources/jar.properties
===================================================================
RCS file: /var/jcvs/javasrc_1_4_scsl/j2se/src/share/classes/sun/tools/jar/resources/jar.properties,v
retrieving revision 1.1.1.3
