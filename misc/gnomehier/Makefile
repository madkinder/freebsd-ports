# New ports collection makefile for:	gnomehier
# Date created:				2 July 2002
# Whom:					Maxim Sobolev <sobomax@FreeBSD.org>
#
# $FreeBSD$
#    $MCom: ports/misc/gnomehier/Makefile,v 1.34 2009/04/09 03:24:08 mezz Exp $
#
# !!DON'T BUMP PORTREVISION ON MTREE CHANGES ANYMORE!!

PORTNAME=	gnomehier
PORTVERSION=	2.3
PORTREVISION=	12
CATEGORIES=	misc gnome
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	A utility port that creates the GNOME directory tree

NO_BUILD=	yes
PLIST?=		${WRKDIR}/pkg-plist
PKGINSTALL=	${WRKDIR}/pkg-install

GNOME_MTREE=	BSD.gnome.dist
GNOME_MTREE_ARGS=${MTREE_ARGS:S|${MTREE_FILE}|${PREFIX}/etc/mtree/${GNOME_MTREE}|}

do-fetch:
	@${DO_NADA}

pre-install:
	@${CP} -f ${FILESDIR}/dirlist ${WRKDIR}
	@${RM} -f ${PLIST} ${WRKDIR}/${GNOME_MTREE}
	@${TOUCH} -f ${PLIST}
	@${ECHO_CMD} etc/mtree/${GNOME_MTREE} >> ${PLIST}
	@${MKDIR} ${WRKSRC}
	@${CAT} ${FILESDIR}/dirlist | ${SORT} -r | ${SED} -e \
		's|^|@dirrm |' >> ${PLIST}
	@${ECHO_CMD} "@unexec ${RMDIR} %D/etc/mtree 2>/dev/null || ${TRUE}" >> ${PLIST}
	@for dir in `${CAT} ${WRKDIR}/dirlist`; \
	do \
		${MKDIR} ${WRKSRC}/$${dir}; \
	done
	@${SED} -e 's|%%MTREE_ARGS%%|${GNOME_MTREE_ARGS}|' \
		< ${FILESDIR}/pkg-install.in > ${PKGINSTALL}

pre-su-install:
	${CHGRP} games ${WRKSRC}/share/games
	${CHMOD} g=rwXs ${WRKSRC}/share/games
	cd ${WRKSRC} && \
		${MTREE_CMD} -U -d -n -i -c -k "uname, gname, mode" | \
		${SED} -e 's|uname=[A-Za-z0-9_]*|uname=root|' \
			-e 's|gname=[A-Za-z0-9_]*|gname=wheel|' \
			> ${WRKDIR}/${GNOME_MTREE}

do-install:
	${MKDIR} ${PREFIX}/etc/mtree
	${INSTALL_DATA} ${WRKDIR}/${GNOME_MTREE} ${PREFIX}/etc/mtree

post-install:
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.mk>
