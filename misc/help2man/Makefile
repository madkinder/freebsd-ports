# Ports collection makefile for:	help2man
# Date created:			Jan 30, 2002
# Whom:				ijliao
#
# $FreeBSD$
#

PORTNAME=	help2man
PORTVERSION=	1.40.4
CATEGORIES=	misc
MASTER_SITES=	GNU/${PORTNAME}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Automatically generating simple manual pages from program output

LICENSE=	GPLv3

CFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_PERL5=	yes

INFO=		${PORTNAME}
MAN1=		${PORTNAME}.1
PLIST_FILES=	bin/${PORTNAME}

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS=	--disable-nls
.else
BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Locale/gettext.pm:${PORTSDIR}/devel/p5-Locale-gettext
RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Locale/gettext.pm:${PORTSDIR}/devel/p5-Locale-gettext

CFLAGS+=	-lintl
MANLANG=	"" ${LANGS} ${LANGS_MTREE}
USE_GETTEXT=	yes

LANGS=		de el eo fi fr it pl pt_BR ru sv uk vi
LANGS_MTREE=	ja	# languages that already exist in BSD.local.dist

PLIST_FILES+=	lib/bindtextdomain.so
.for lang in ${LANGS} ${LANGS_MTREE}
PLIST_FILES+=	share/locale/${lang}/LC_MESSAGES/${PORTNAME}.mo
.endfor
.for lang in ${LANGS}
PLIST_DIRSTRY+=	man/${lang}/man1 man/${lang}
.endfor
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^pkglibdir/ s|/${PORTNAME}$$||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
