# New ports collection makefile for:	dmake
# Date created:		31 July 1995
# Whom:			nils@guru.ims.uni-stuttgart.de
#
# $FreeBSD$
#

PORTNAME=	dmake
PORTVERSION=	4.12
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	http://dmake.apache-extras.org.codespot.com/files/

MAINTAINER=	office@FreeBSD.org
COMMENT=	Another hyper make utility

LICENSE=	GPLv1

USE_BZIP2=        yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--datarootdir=${DATADIR}

MAN1=		dmake.1

post-install:
	${INSTALL_MAN} ${WRKSRC}/man/dmake.tf ${PREFIX}/man/man1/dmake.1

.include <bsd.port.mk>
