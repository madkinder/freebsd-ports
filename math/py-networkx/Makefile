# Ports collection makefile for:        py-networkx
# Date created:			June, 20  2008
# Whom:				dikshie
# $FreeBSD$

PORTNAME=	networkx
PORTVERSION=	1.5
CATEGORIES=	math python
MASTER_SITES=	http://networkx.lanl.gov/download/networkx/ \
		CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	dikshie@sfc.wide.ad.jp
COMMENT=	Tools for complex network

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes

.include <bsd.port.pre.mk>

post-patch:
	${REINPLACE_CMD} "s,^docdirbase  =.*,docdirbase = '${DOCSDIR}'," ${WRKSRC}/setup.py

post-install:
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}
	cd ${WRKSRC}/examples \
		&& ${FIND} . -type d -exec ${MKDIR} ${EXAMPLESDIR}/\{} \; \
		&& ${FIND} . -type f -exec ${INSTALL_DATA} \{} ${EXAMPLESDIR}/\{} \;
.endif

	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
