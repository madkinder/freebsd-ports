# New ports collection makefile for:	svn2git
# Date created:				2011-03-30
# Whom:					David Naylor <naylor.b.david@gmail.com>
#
# $FreeBSD$

PORTNAME=	svn2git
DISTVERSION=	1.0.4
CATEGORIES=	devel kde
MASTER_SITES=	http://cloud.github.com/downloads/DragonSA/svn2git/

MAINTAINER=	naylor.b.david@gmail.com
COMMENT=	Imports svn repositories into git

LIB_DEPENDS=	svn_client-1:${PORTSDIR}/devel/subversion
RUN_DEPENDS+=	git:${PORTSDIR}/devel/git \
		${SITE_PERL}/${PERL_ARCH}/Term/ReadKey.pm:${PORTSDIR}/devel/p5-Term-ReadKey \
		${SITE_PERL}/${PERL_ARCH}/SVN/Core.pm:${PORTSDIR}/devel/p5-subversion

LICENSES=	GPLv1 GPLv2 GPLv3

USE_XZ=		yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib qmake_build
MAKE_JOBS_SAFE=	yes

PLIST_FILES=	bin/svn2git

post-patch:
	${REINPLACE_CMD} "s|/usr/local|${LOCALBASE}|" ${WRKSRC}/src/src.pro

do-configure:
	(cd ${WRKSRC}; ${SETENV} ${CONFIGURE_ENV} ${QMAKE} ${QMAKEFLAGS} fast-export2.pro)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/svn2git ${PREFIX}/bin/

.include <bsd.port.mk>
