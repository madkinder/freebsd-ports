# New ports collection makefile for:	fsh
# Date created:				Thu Jan 24 03:37:54 JST 2002
# Whom:					sumikawa
#
# $FreeBSD$

PORTNAME=	fsh
PORTVERSION=	1.2
PORTREVISION=	3
CATEGORIES=	security
MASTER_SITES=	http://www.lysator.liu.se/fsh/ \
		http://mirror2.unixfreunde.de/ \
		http://freebsd.unixfreunde.de/sources/

MAINTAINER=	sumikawa@FreeBSD.org
COMMENT=	Fast remote command execution

USE_PYTHON=	yes
GNU_CONFIGURE=	yes

INFO=	fsh

post-patch:
	${REINPLACE_CMD} -e '/^[^#]/s/FCNTL/fcntl/g' ${WRKSRC}/fshcompat.py

post-build:
	${PYTHON_CMD} -c 'import py_compile; py_compile.main()' ${WRKSRC}/*.py

post-install:
	${INSTALL_DATA} ${WRKSRC}/*.pyc ${PREFIX}/share/fsh

.include <bsd.port.mk>
