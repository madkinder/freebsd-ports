# New ports collection makefile for:	wav2cdr
# Date created:				9 Sep 2005
# Whom:					Emanuel Haupt <ehaupt@critical.ch>
#
# $FreeBSD$
#

PORTNAME=	wav2cdr
PORTVERSION=	2.3.3
CATEGORIES=	audio converters
MASTER_SITES=	CRITICAL

MAINTAINER=	ehaupt@FreeBSD.org
COMMENT=	Converts WAV files into CDR audio file format

MAKE_JOBS_SAFE=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}
SRC=		wav2cdr cmdarg data fileio process

LICENSE=	GPLv2
PLIST_FILES=	bin/wav2cdr
MAN1=		wav2cdr.1

do-build:
.for f in ${SRC}
	${CC} ${CFLAGS} -c -o ${WRKSRC}/${f}.o ${WRKSRC}/${f}.c
.endfor
	${CC} ${CFLAGS} ${LDFLAGS} -o ${WRKSRC}/${PORTNAME} \
		${SRC:C/(.*)/${WRKSRC}\/\1.o/}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
