# New ports collection makefile for:   callid
# Date created:        19 February 2004
# Whom:                M. Possamai
#
# $FreeBSD$
#

PORTNAME=	callid
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	http://possamai.home.xs4all.nl/callid/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Utility to log incoming calls using ISDN and output to mysql/php

USE_MYSQL=	yes
USE_PERL5=	yes
USE_PHP=	yes
WANT_PHP_WEB=	yes

NO_BUILD=	yes

PORTDOCS=	CHANGES README TODO make-db.mysql

RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/DBI.pm:${PORTSDIR}/databases/p5-DBI

pre-everything::
	@${ECHO} ""
	@${ECHO} "You have to configure PHP with MYSQL support."
	@${ECHO} ""
	@${ECHO} "If you have already compiled PHP without MYSQL,"
	@${ECHO} "press CTRL+C now and rebuild it before installing callid."
	@${ECHO} ""

do-install:
	@${MKDIR} ${PREFIX}/www/callid
	@${INSTALL_DATA} ${WRKSRC}/src/*.php ${PREFIX}/www/callid
	@${INSTALL_DATA} ${WRKSRC}/src/*.html ${PREFIX}/www/callid
	@${MKDIR} ${PREFIX}/www/callid/images
	@${INSTALL_DATA} ${WRKSRC}/src/images/*.jpg ${PREFIX}/www/callid/images
	@${INSTALL_DATA} -m 550 ${WRKSRC}/sbin/call-logd ${PREFIX}/sbin
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/doc/${f} ${DOCSDIR}
.endfor
.endif

post-install:
	@if [ ! -f ${PREFIX}/etc/rc.d/callid.sh ]; then \
		${ECHO} "Installing ${PREFIX}/etc/rc.d/callid.sh startup file."; \
		${INSTALL_SCRIPT} -m 751 ${WRKSRC}/etc/rc.d/callid.sh ${PREFIX}/etc/rc.d/callid.sh; \
	fi

.include <bsd.port.mk>
