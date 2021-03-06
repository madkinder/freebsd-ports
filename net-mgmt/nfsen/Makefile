# New ports collection makefile for:	nfsen
# Date created:		25 March 2005
# Whom:			janos.mohacsi@bsd.hu
#
# $FreeBSD$
#

PORTNAME=	nfsen
PORTVERSION=	1.3.5
CATEGORIES=	net-mgmt
MASTER_SITES=	SF/${PORTNAME}/stable/${PORTNAME}-${PORTVERSION} \
		http://nfsen.sourceforge.net/

MAINTAINER=	janos.mohacsi@bsd.hu
COMMENT=	Web based frontend to nfdump netflow collector

LICENSE=	BSD
LICENSE_FILE=	${WRKSRC}/BSD-license.txt

RUN_DEPENDS=	${SITE_PERL}/RRDp.pm:${PORTSDIR}/databases/rrdtool \
		${SITE_PERL}/Mail/Header.pm:${PORTSDIR}/mail/p5-Mail-Tools \
		nfdump:${PORTSDIR}/net-mgmt/nfdump

USE_ICONV=	yes
USE_PERL5=	yes
USE_PHP=	session pcre sockets
NO_BUILD=	yes
PLIST_SUB+=	PORTNAME=${PORTNAME}
USE_RC_SUBR=	nfsen

.if defined(PACKAGE_BUILDING)
IGNORE=		needs running syslogd
.endif

post-patch:
	@${REINPLACE_CMD} -e 's,%%PREFIX%%,${PREFIX},' -e 's,%%PORTNAME%%,${PORTNAME},' \
		${WRKSRC}/etc/nfsen-dist.conf
	@${RM} ${WRKSRC}/etc/nfsen-dist.conf.*
	@${REINPLACE_CMD} -e 's,%%PERL%%,${PERL},' -e 's,%%PREFIX%%,${PREFIX},' ${WRKSRC}/install.pl

do-install:
	@${MKDIR} ${PREFIX}/var/${PORTNAME}/profiles/live
	@${MKDIR} ${PREFIX}/libexec/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/installer-items/CopyRecursive.pm ${PREFIX}/libexec/${PORTNAME}/
	${INSTALL_DATA} ${WRKSRC}/installer-items/RRDconvertv1.pm ${PREFIX}/libexec/${PORTNAME}/
	@ if [ -f ${PREFIX}/etc/nfsen.conf ] ; then \
	${ECHO_MSG} "installing with existing nfsen.conf"; \
	cd ${WRKSRC} ;${PERL} ${WRKSRC}/install.pl ${PREFIX}/etc/nfsen.conf; \
	else \
	${ECHO_MSG} "installing with sample nfsen.conf"; \
	cd ${WRKSRC} ;${PERL} ${WRKSRC}/install.pl ${WRKSRC}/etc/nfsen-dist.conf; \
	fi
	@${ECHO_MSG} "Configure your ${LOCALBASE}/etc/nfsen.conf to have necessary sources ";
	@${ECHO_MSG} "Then run 'nfsen -R ${LOCALBASE}/etc/nfsen.conf' to correctly setup source, RRD, and profile files";

.include <bsd.port.mk>
