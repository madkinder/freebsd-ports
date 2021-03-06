# New ports collection makefile for:	py-namebench
# Date created:				04 December 2009
# Whom:					Sahil Tandon <sahil@tandon.net>
#
# $FreeBSD$
#

PORTNAME=	namebench
PORTVERSION=	1.3.1
CATEGORIES=	dns python
MASTER_SITES=	GOOGLE_CODE
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-${PORTVERSION}-source
EXTRACT_SUFX=	.tgz

MAINTAINER=	jhelfman@experts-exchange.com
COMMENT=	An open-source DNS benchmark utility

LICENSE=	ASL

RUN_DEPENDS+=	\
	${PYTHON_PKGNAMEPREFIX}Jinja2>=2.5.5:${PORTSDIR}/devel/py-Jinja2 \
	${PYTHON_PKGNAMEPREFIX}graphy>=1.0:${PORTSDIR}/graphics/py-graphy \
	${PYTHON_PKGNAMEPREFIX}dnspython>=1.9.4:${PORTSDIR}/dns/py-dnspython \
	${PYTHON_PKGNAMEPREFIX}httplib2>=0.6.0:${PORTSDIR}/www/py-httplib2 \
	${PYTHON_PKGNAMEPREFIX}simplejson>=2.1.6:${PORTSDIR}/devel/py-simplejson

.if !defined(WITHOUT_X11)
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tkinter>=2.7.1:${PORTSDIR}/x11-toolkits/py-tkinter
.endif

MAKE_ENV+=	NO_THIRD_PARTY=yes
WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION}

PORTDOCS=	README.txt

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_INSTALLARGS+=	--install-data=${PREFIX}/share

NO_INSTALL_MANPAGES=	yes

post-patch:
	@${REINPLACE_CMD} -e 's,/usr/local,${PREFIX},' \
		${WRKSRC}/libnamebench/util.py

post-install:
.if !defined(NOPORTDOCS)
	@${INSTALL} -o ${DOCOWN} -g ${DOCGRP} -m 555 -d ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
