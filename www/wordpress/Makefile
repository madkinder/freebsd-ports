# New ports collection makefile for:	wordpress
# Date created:		2004-07-29
# Whom:			Elvis Chiang <elvis@sslab.cs.ccu.edu.tw>
#
# $FreeBSD$
#

PORTNAME=	wordpress
PORTVERSION=	3.2.1
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	http://wordpress.org/

MAINTAINER=	ychsiao@ychsiao.org
COMMENT=	A state-of-the-art semantic personal publishing platform

CONFLICTS_INSTALL=	de-wordpress-de-3.* ja-wordpress-ja-3.*

NO_BUILD=	yes
USE_PHP=	gd mysql pcre tokenizer xml zip
WANT_PHP_WEB=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST=		${WRKDIR}/pkg-plist
PORTDOCS=	license.txt readme.html

pre-everything::
	@${ECHO_CMD} "If you want to upgrade, you must read upgrade document."
	@${ECHO_CMD} ""
	@sleep 1

pre-install:
	cd ${WRKSRC}/ && \
		(${FIND} -s * -type f | ${SED} -e 's|^|%%WWWDIR%%/|'; \
		${FIND} -d . -type d | ${SED} -e 's|^\.|@dirrm %%WWWDIR%%|') > ${PLIST}
	if [ ! -f ${WRKSRC}/wp-config-sample.php ]; then ${CP} \
		${WRKSRC}/wp-config.php.sample ${WRKSRC}/wp-config.php; fi

do-install:
	${INSTALL} -d -g ${WWWGRP} -m 755 -o ${WWWOWN} ${WWWDIR}/
	${CP} -R ${WRKSRC}/ ${WWWDIR}/
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}/
.endif

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
