# New ports collection makefile for:    virtuoso
# Date created:         		Jul 08, 2006
# Whom:                 		Max Khon <fjoe@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	virtuoso
PORTVERSION=	6.1.3
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-opensource-${PORTVERSION}

MAINTAINER=	fjoe@FreeBSD.org
COMMENT=	Universal SQL/Application Server

BUILD_DEPENDS=	gawk:${PORTSDIR}/lang/gawk\
		htmldoc:${PORTSDIR}/textproc/htmldoc
LIB_DEPENDS=	iodbc.3:${PORTSDIR}/databases/libiodbc

USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--with-readline\
		--without-jdk2\
		--without-jdk3\
		--without-jdk4\
		--with-iodbc=${LOCALBASE}\
		--enable-bpel-vad\
		--datadir="${PREFIX}"\
		--localstatedir="${PREFIX}"
CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib
USE_RC_SUBR=	virtuoso.sh
ONLY_FOR_ARCHS=	i386 amd64
USERS=		virtuoso
GROUPS=		virtuoso

CHECK_PORT=	/usr/bin/nc -z localhost $$\1 2>\&1

OPTIONS=	IMAGEMAGICK "ImageMagick support" off\
		KERBEROS "Kerberos extension" off\
		OPENLDAP "OpenLDAP support" off
#		PERL "Perl hosting" off
#		PYTHON "Python hosting" off
#		MONO "Mono extension" off\
#		PHP4 "PHP4 extension" off\
#		PHP5 "PHP5 extension" off\
#		RUBY "Ruby hosting" off\

post-patch:
	${REINPLACE_CMD}\
		-e 's,-lpthreads,${PTHREAD_LIBS},g'\
		-e 's,-lruby,-lruby${RUBY_VER:S,.,,},g'\
			${WRKSRC}/configure
	${FIND} ${WRKSRC} -name '*.sh' | ${XARGS} ${GREP} -l 'netstat -an.*grep LISTEN' |\
	    ${XARGS} ${REINPLACE_CMD}\
		-e 's,expr \$$,expr -- $$,'\
		-e 's,netstat -an.*grep.*$$\([a-zA-Z0-9]*\).*grep LISTEN,${CHECK_PORT},'
	${FIND} -E ${WRKSRC} -type f -name "mkvad.sh" -o -name "make_vad.sh" -o -name "mkdoc.sh" |\
	    ${XARGS} ${REINPLACE_CMD}\
		-e 's,-isql,-isql-vt,'

post-install:
	PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.pre.mk>

.if defined(WITH_IMAGEMAGICK)
CONFIGURE_ARGS+=--enable-imagemagick=${LOCALBASE}
LIB_DEPENDS+=	MagickWand.5:${PORTSDIR}/graphics/ImageMagick
PLIST_SUB+=	WITH_IMAGEMAGICK=""
.else
CONFIGURE_ARGS+=--disable-imagemagick
PLIST_SUB+=	WITH_IMAGEMAGICK="@comment "
.endif

.if defined(WITH_KERBEROS)
CONFIGURE_ARGS+=--enable-krb=${LOCALBASE}
LIB_DEPENDS+=	krb5.3:${PORTSDIR}/security/krb5
.endif

# XXX broken (does not build, requires gc.h)
#.if defined(WITH_MONO)
#CONFIGURE_ARGS+=--enable-mono
#.endif

.if defined(WITH_OPENLDAP)
CONFIGURE_ARGS+=--enable-openldap=${LOCALBASE}
USE_OPENLDAP=	yes
.endif

# XXX broken (requires perl to be built with -Dusemultiplicity)
#.if defined(WITH_PERL)
#CONFIGURE_ARGS+=--enable-perl
#USE_PERL5=	yes
#.endif

# XXX broken (no libphp)
#.if defined(WITH_PHP4)
#CONFIGURE_ARGS+=--enable-php4
#.endif

# XXX broken (no libphp)
#.if defined(WITH_PHP5)
#CONFIGURE_ARGS+=--enable-php5
#.endif

# XXX broken (USE_PYTHON does not work with OPTIONS)
#.if defined(WITH_PYTHON)
#CONFIGURE_ARGS+=--enable-python
#USE_PYTHON=	yes
#.endif

# XXX broken (USE_LIBRUBY does not work with OPTIONS)
#.if defined(WITH_RUBY)
#CONFIGURE_ARGS+=--enable-ruby
#USE_LIBRUBY=	yes
#.endif

.include <bsd.port.post.mk>
