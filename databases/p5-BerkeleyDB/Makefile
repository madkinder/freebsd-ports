# ports collection makefile for:	perl interface to Berkeley DB v3
# Date created:				3 January 2001
# Whom:					T. William Wells <bill@twwells.com>
#
# $FreeBSD$
#

PORTNAME=	BerkeleyDB
PORTVERSION=	0.49
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:PMQS
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl5 interface to the Berkeley DB package

USE_BDB=	47+

LICENSE_COMB=	dual
LICENSE=	ART10 GPLv1

PERL_CONFIGURE=	yes

MAN3=		BerkeleyDB.3

post-patch:
	@${ECHO} "INCLUDE = ${BDB_INCLUDE_DIR}" > ${WRKSRC}/config.in
	@${ECHO} "LIB = ${LOCALBASE}/lib" >> ${WRKSRC}/config.in
	@${ECHO} "DBNAME = -l${BDB_LIB_NAME}" >> ${WRKSRC}/config.in

.include <bsd.port.mk>
