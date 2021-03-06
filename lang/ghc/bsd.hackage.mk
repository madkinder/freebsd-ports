#
# $FreeBSD: ports/lang/ghc/bsd.hackage.mk,v 1.72 2011/09/06 03:13:38 ashish Exp $
#
# bsd.hackage.mk -- List of Haskell Cabal ports.
#
# Created by: Gabor Pali <pgj@FreeBSD.org>,
# Based on works of Giuseppe Pilichi and Ashish Shukla.
#
# Maintained by: haskell@FreeBSD.org
#

# KEEP THE LIST ALPHABETICALLY SORTED!

aeson_port=			converters/hs-aeson
Agda_port=			math/hs-Agda		# executable
Agda-executable_port=		math/hs-Agda-executable	# executable
alex_port=			devel/hs-alex		# executable
ALUT_port=			audio/hs-ALUT
ansi-terminal_port=		devel/hs-ansi-terminal
ansi-wl-pprint_port=		devel/hs-ansi-wl-pprint
arrows_port=			devel/hs-arrows
attoparsec_port=		textproc/hs-attoparsec
attoparsec-enumerator_port=	textproc/hs-attoparsec-enumerator
attoparsec-text_port=		textproc/hs-attoparsec-text
base64-bytestring_port=		devel/hs-base64-bytestring
binary_port=			devel/hs-binary
bio_port=			science/hs-bio
blaze-builder_port=		devel/hs-blaze-builder
blaze-builder-enumerator_port=	devel/hs-blaze-builder-enumerator
blaze-html_port=		textproc/hs-blaze-html
blaze-textual_port=		devel/hs-blaze-textual
BNFC_port=			devel/hs-BNFC		# executable
Boolean_port=			devel/hs-Boolean
brainfuck_port=			lang/hs-brainfuck	# executable
bsd-sysctl_port=		devel/hs-bsd-sysctl
bytestring-nums_port=		devel/hs-bytestring-nums	# executable
c2hs_port=			devel/hs-c2hs		# executable
cabal-install_port=		devel/hs-cabal-install	# executable
cereal_port=			devel/hs-cereal
cairo_port=			graphics/hs-cairo
case-insensitive_port=		textproc/hs-case-insensitive
categories_port=		math/hs-categories
cgi_port=			www/hs-cgi
checkers_port=			devel/hs-checkers
citeproc-hs_port=		textproc/hs-citeproc-hs
cmdargs_port=			devel/hs-cmdargs
comonad_port=			math/hs-comonad
comonad-transformers_port=	math/hs-comonad-transformers
contravariant_port=		math/hs-contravariant
convertible_port=		devel/hs-convertible
cpphs_port=			devel/hs-cpphs		# executable
criterion_port=			benchmarks/hs-criterion
Crypto_port=			security/hs-Crypto
csv_port=			textproc/hs-csv
curl_port=			ftp/hs-curl
darcs_port=			devel/hs-darcs		# executable
data-default_port=		devel/hs-data-default
dataenc_port=			converters/hs-dataenc
datetime_port=			devel/hs-datetime
DeepArrow_port=			devel/hs-DeepArrow
deepseq_port=			devel/hs-deepseq
Diff_port=			textproc/hs-Diff
digest_port=			security/hs-digest
directory-tree_port=		devel/hs-directory-tree
distributive_port=		math/hs-distributive
dlist_port=			devel/hs-dlist
double-conversion_port=		textproc/hs-double-conversion
enumerator_port=		devel/hs-enumerator
erf_port=			math/hs-erf
fastcgi_port=			www/hs-fastcgi		# lib_depends
feed_port=			textproc/hs-feed
fgl_port=			devel/hs-fgl
filemanip_port=			devel/hs-filemanip
gconf_port=			devel/hs-gconf
ghc-mtl_port=			devel/hs-ghc-mtl
ghc-paths_port=			devel/hs-ghc-paths
gio_port=			devel/hs-gio
git-annex_port=			devel/hs-git-annex	# executable
glade_port=			devel/hs-glade
glib_port=			devel/hs-glib
GLUT_port=			x11-toolkits/hs-GLUT
gstreamer_port=			multimedia/hs-gstreamer
gtk_port=			x11-toolkits/hs-gtk
gtk2hs-buildtools_port=		devel/hs-gtk2hs-buildtools # executable
gtkglext_port=			x11-toolkits/hs-gtkglext
gtksourceview2_port=		x11-toolkits/hs-gtksourceview2
haddock_port=			devel/hs-haddock	# executable
happy_port=			devel/hs-happy		# executable
hashable_port=			devel/hs-hashable
hashed-storage_port=		devel/hs-hashed-storage
haskeline_port=			devel/hs-haskeline
haskell-src_port=		devel/hs-haskell-src
haskell-src-exts_port=		devel/hs-haskell-src-exts
HaXml_port=			textproc/hs-HaXml	# executable
heist_port=			www/hs-heist
HGL_port=			graphics/hs-HGL
highlighting-kate_port=		textproc/hs-highlighting-kate
hint_port=			devel/hs-hint
hlibev_port=			devel/hs-hlibev		# lib_depends
hoogle_port=			devel/hs-hoogle		# executable
hostname_port=			net/hs-hostname
hs-bibutils_port=		textproc/hs-hs-bibutils
hS3_port=			www/hs-hS3		# executable
hscolour_port=			print/hs-hscolour	# executable
hslogger_port=			devel/hs-hslogger
html_port=			textproc/hs-html
HTTP_port=			www/hs-HTTP
http-server_port=		www/hs-http-server
http-types_port=		www/hs-http-types
HUnit_port=			devel/hs-HUnit
hxt_port=			textproc/hs-hxt
hxt-charproperties_port=	textproc/hs-hxt-charproperties
hxt-regex-xmlschema_port=	textproc/hs-hxt-regex-xmlschema
hxt-unicode_port=		textproc/hs-hxt-unicode
json_port=			converters/hs-json
language-c_port=		devel/hs-language-c
lazysmallcheck_port=		devel/hs-lazysmallcheck
lhs2tex_port=			textproc/hs-lhs2tex
libmpd_port=			audio/hs-libmpd
libxml_port=			textproc/hs-libxml
MemoTrie_port=			devel/hs-MemoTrie
mime_port=			mail/hs-mime
MissingH_port=			devel/hs-MissingH
mmap_port=			devel/hs-mmap
monad-par_port=			devel/hs-monad-par
MonadCatchIO-mtl_port=		devel/hs-MonadCatchIO-mtl
MonadCatchIO-transformers_port=	devel/hs-MonadCatchIO-transformers
mtl_port=			devel/hs-mtl
mueval_port=			devel/hs-mueval		# executable
murmur-hash_port=		devel/hs-murmur-hash
mwc-random_port=		math/hs-mwc-random
mysql_port=			databases/hs-mysql
network_port=			net/hs-network
ObjectName_port=		devel/hs-ObjectName
oeis_port=			www/hs-oeis
OpenAL_port=			audio/hs-OpenAL
OpenGL_port=			x11-toolkits/hs-OpenGL
pandoc_port=			textproc/hs-pandoc	# executable
pandoc-types_port=		textproc/hs-pandoc-types
pango_port=			x11-toolkits/hs-pango
parallel_port=			devel/hs-parallel
parsec_port=			textproc/hs-parsec
pcap_port=			net/hs-pcap
pcre-light_port=		devel/hs-pcre-light	# lib_depends
polyparse_port=			textproc/hs-polyparse
pointed_port=			math/hs-pointed
porte_port=			ports-mgmt/hs-porte	# executable
primitive_port=			devel/hs-primitive
probability_port=		math/hs-probability
PSQueue_port=			devel/hs-PSQueue
QuickCheck_port=		devel/hs-QuickCheck
reactive_port=			devel/hs-reactive
readline_port=			devel/hs-readline
regex-base_port=		textproc/hs-regex-base
regex-compat_port=		textproc/hs-regex-compat
regex-pcre-builtin_port=	textproc/hs-regex-pcre-builtin
regex-posix_port=		textproc/hs-regex-posix
safe_port=			devel/hs-safe
scgi_port=			www/hs-scgi
sendfile_port=			net/hs-sendfile
semigroupoids_port=		math/hs-semigroupoids
semigroups_port=		math/hs-semigroups
SHA_port=			security/hs-SHA
show_port=			devel/hs-show
simple-sendfile_port=		net/hs-simple-sendfile
smallcheck_port=		devel/hs-smallcheck
snap_port=			www/hs-snap
snap-core_port=			www/hs-snap-core
snap-server_port=		www/hs-snap-server	# lib_depends
soegtk_port=			graphics/hs-soegtk
split_port=			devel/hs-split
StateVar_port=			devel/hs-StateVar
statistics_port=		math/hs-statistics
stm_port=			devel/hs-stm
Stream_port=			devel/hs-Stream
stringsearch_port=		textproc/hs-stringsearch
svgcairo_port=			graphics/hs-svgcairo
syb_port=			devel/hs-syb
tagsoup_port=			textproc/hs-tagsoup	# executable
tar_port=			archivers/hs-tar
Tensor_port=			devel/hs-Tensor
terminfo_port=			devel/hs-terminfo
test-framework_port=		devel/hs-test-framework
test-framework-hunit_port=	devel/hs-test-framework-hunit
test-framework-quickcheck2_port=	devel/hs-test-framework-quickcheck2
testpack_port=			devel/hs-testpack
texmath_port=			textproc/hs-texmath	# executable
text_port=			devel/hs-text
transformers_port=		devel/hs-transformers
TypeCompose_port=		devel/hs-TypeCompose
unamb_port=			devel/hs-unamb
uniplate_port=			devel/hs-uniplate
unix-compat_port=		devel/hs-unix-compat
unlambda_port=			lang/hs-unlambda	# executable
unordered-containers_port=	devel/hs-unordered-containers
url_port=			www/hs-url
utf8-string_port=		devel/hs-utf8-string
utility-ht_port=		devel/hs-utility-ht
uuagc_port=			devel/hs-uuagc		# executable
uulib_port=			devel/hs-uulib
vector_port=			devel/hs-vector
vector-algorithms_port=		devel/hs-vector-algorithms
vector-space_port=		math/hs-vector-space
void_port=			devel/hs-void
vte_port=			x11-toolkits/hs-vte
wai_port=			www/hs-wai
warp_port=			www/hs-warp
webkit_port=			www/hs-webkit
X11_port=			x11/hs-X11		# lib_depends
X11-xft_port=			x11/hs-X11-xft
xhtml_port=			textproc/hs-xhtml
xml_port=			textproc/hs-xml
xmlhtml_port=			textproc/hs-xmlhtml
xmobar_port=			x11/hs-xmobar		# executable
xmonad_port=			x11-wm/hs-xmonad	# executable
xmonad-contrib_port=		x11-wm/hs-xmonad-contrib
zip-archive_port=		archivers/hs-zip-archive
zlib_port=			archivers/hs-zlib
