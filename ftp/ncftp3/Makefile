# ex:ts=8
# Ports collection makefile for:  ncftp3
# Date created:			  4 Nov 1994
# Whom:				  ache
#
# $FreeBSD$
#

PORTNAME=	ncftp
PORTVERSION=	3.2.4
PORTREVISION?=	0
CATEGORIES=	ftp ipv6
MASTER_SITES=	ftp://ftp.ncftp.com/ncftp/ \
		ftp://ftp.mirrorservice.org/sites/ftp.ncftp.com/ncftp/
DISTNAME=	ncftp-${PORTVERSION}-src

.if !defined(WITHOUT_NCFTP_IPV6) && !defined(WITHOUT_IPV6)
#PATCH_SITES=	ftp://ftp.kame.net/pub/kame/misc/
#PATCHFILES=	ncftp-323-v6-20091109.diff.gz
#PATCH_DIST_STRIP=	-p1
.endif

MAINTAINER=	obrien@FreeBSD.org
COMMENT=	ftp replacement with advanced user interface

USE_BZIP2=	yes

.include <bsd.port.pre.mk>

.if defined(INSTALL_AS_NCFTP3)
LATEST_LINK=	ncftp3
.else
LATEST_LINK=	ncftp
.endif
WRKSRC=		${WRKDIR}/${DISTNAME:S/-src//}
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ncurses
CONFIGURE_ENV=	TAR=/usr/bin/tar
PLIST_SUB=	NCFTP=${LATEST_LINK}
MAN1=		${LATEST_LINK}.1 ncftpbatch.1 ncftpget.1 ncftpls.1 ncftpput.1 \
		ncftpspooler.1
MAN3=		Strn.3

LIBNCFTP=	libncftp.so.3
LIBSIO=		libsio.so.5
LIBSTRN=	libStrn.so.1

pre-fetch:
	@${ECHO} ""
	@${ECHO} "Use INSTALL_AS_NCFTP3=yes to install ncftp v3 as ${PREFIX}/bin/ncftp3"
	@${ECHO} ""

pre-build:
	cd ${WRKSRC}/Strn ; make so
	cd ${WRKSRC}/libncftp ; make so
	cd ${WRKSRC}/sio; make so

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/bin/ncftp ${PREFIX}/bin/${LATEST_LINK}
	@cd ${WRKSRC}/bin ; ${INSTALL_PROGRAM} \
		ncftpbatch ncftpbookmarks ncftpget ncftpls ncftpput \
		${PREFIX}/bin
	@cd ${PREFIX}/bin && ${LN} -f ncftpbatch ncftpspooler
	@cd ${WRKSRC} && ${INSTALL_DATA} \
		Strn/${LIBSTRN} libncftp/${LIBNCFTP} sio/${LIBSIO} \
		${PREFIX}/lib
	@cd ${PREFIX}/lib \
		&& ${LN} -sf ${LIBSTRN} libStrn.so \
		&& ${LN} -sf ${LIBNCFTP} libncftp.so \
		&& ${LN} -sf ${LIBSIO} libsio.so
	@${INSTALL_MAN} ${WRKSRC}/doc/man/ncftp.1 \
		${PREFIX}/man/man1/${LATEST_LINK}.1
	@cd ${WRKSRC}/doc/man ; ${INSTALL_MAN} \
		ncftpbatch.1 ncftpget.1 ncftpls.1 ncftpput.1 ncftpspooler.1 \
		${PREFIX}/man/man1
	@${INSTALL_MAN} ${WRKSRC}/Strn/Strn.3 ${PREFIX}/man/man3

.include <bsd.port.post.mk>
