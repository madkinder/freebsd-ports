# New ports collection makefile for:	ircd-ratbox
# Date Created:				2006-01-27
# Whom:					Shaun Amott <shaun@inerd.com>
#
# $FreeBSD$
#
# ex: ts=8

PORTNAME=	ircd-ratbox
PORTVERSION=	2.2.9
CATEGORIES=	irc ipv6
MASTER_SITES=	ftp://ftp.ircd-ratbox.org/pub/ircd-ratbox/		\
		ftp://ftp.demon.co.uk/pub/mirrors/ircd-ratbox/		\
		http://www.ircd-ratbox.org/download/			\
		ftp://ftp.parodius.com/pub/ircd-ratbox/			\
		http://www.ircd-ratbox.org/download/old/

MAINTAINER=	moggie@elasticmind.net
COMMENT=	An advanced, stable IRC daemon, used on many EFnet servers

CONFLICTS=	ircd-ratbox-devel-[0-9]*

USE_BZIP2=	yes
MAN8=		ircd.8
USE_RC_SUBR=	ircd-ratbox.sh
USE_PERL5_BUILD=	yes

USERS=		ircd
GROUPS=		${USERS}

LOGDIR=		/var/log/${PORTNAME}
RUNDIR=		/var/run/${PORTNAME}
SUB_FILES=	pkg-message pkg-install
PLIST_SUB=	LOGDIR=${LOGDIR} RUNDIR=${RUNDIR}
SUB_LIST=	LOGDIR=${LOGDIR} RUNDIR=${RUNDIR}

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-confdir=${PREFIX}/etc/${PORTNAME}	   \
		--with-logdir=/var/log/${PORTNAME}		   \
		--with-moduledir=${PREFIX}/lib/${PORTNAME}/modules \
		--with-helpdir=${DATADIR}/help

PORTDOCS=	[^i]*.txt README.* technical/[^i]*.txt Tao-of-IRC.*

#-- Options ------------------------------------------------------------

OPTIONS=	KQUEUE		"Use superior kqueue(2) instead of poll(2)"	on  \
		OPENSSL		"Enable openssl support"			on  \
		IPV6		"Enable IPv6 support"				on  \
		ZIPLINKS	"Enable ziplinks support"			on  \
		SHARED_MODULES	"Enable shared modules support"			on  \
		ASSERT		"Enable debugging code"				off \
		SMALL_NET	"Tune server for small networks"		off \
		SERVICES	"Enable ratbox-services compatibility code"	off

#----------------------------------------------------------------------

.include <bsd.port.pre.mk>

.if defined(WITH_KQUEUE)
CONFIGURE_ARGS+=	--enable-kqueue
.else
CONFIGURE_ARGS+=	--enable-poll
.endif

.if defined(WITH_OPENSSL)
.include "${PORTSDIR}/Mk/bsd.openssl.mk"
CONFIGURE_ARGS+=	--enable-openssl
.else
CONFIGURE_ARGS+=	--disable-openssl
.endif

.if !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
.endif

.if defined(WITHOUT_ZIPLINKS)
CONFIGURE_ARGS+=	--disable-zlib
.endif

.if defined(WITHOUT_SHARED_MODULES)
CONFIGURE_ARGS+=	--disable-shared-modules
.endif

.if defined(WITH_ASSERT)
CONFIGURE_ARGS+=	--enable-assert
.else
CONFIGURE_ARGS+=	--disable-assert
.endif

.if defined(WITH_SMALL_NET)
CONFIGURE_ARGS+=	--enable-small-net
.endif

.if defined(WITH_SERVICES)
CONFIGURE_ARGS+=	--enable-services
.endif

#-- User Configuration -------------------------------------------------

.if defined(NICKLEN)
CONFIGURE_ARGS+=	--with-nicklen=${NICKLEN}
.endif

.if defined(TOPICLEN)
CONFIGURE_ARGS+=	--with-topiclen=${TOPICLEN}
.endif

#-----------------------------------------------------------------------

pre-configure:
	@${ECHO_MSG} ""
	@${ECHO_MSG} "This port has additional options:"
	@${ECHO_MSG} "    NICKLEN     [default 9, max 50]    - Max nick length on server"
	@${ECHO_MSG} "    TOPICLEN    [default 160, max 390] - Max topic length"
	@${ECHO_MSG} ""
	@${ECHO_MSG} "    SERVER_NAME [default 'services.ircd-ratbox.org'] - Name of services"
	@${ECHO_MSG} "    USER_SERV   [default 'USERSERV'] - Name of user registration service"
	@${ECHO_MSG} "    CHAN_SERV   [default 'CHANSERV'] - Name of channel registration serv'"
	@${ECHO_MSG} "    NICK_SERV   [default 'NICKSERV'] - Name of nickname registration serv'"
	@${ECHO_MSG} "    ALIS_SERV   [default 'ALIS'] - Name of channel list service"
	@${ECHO_MSG} "    OPER_BOT    [default 'OPERBOT'] - Name of operbot service"
	@${ECHO_MSG} "    OPER_SERV   [default 'OPERSERV'] - Name of oper command service"
	@${ECHO_MSG} "    JUPE_SERV   [default 'JUPESERV'] - Name of jupe service"
	@${ECHO_MSG} "    GLOBAL_SERV [default 'GLOBAL'] - Name of global announce service"
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Press CTRL+C now if you wish to set them."
	@${ECHO_MSG} ""

pre-build:
	@${REINPLACE_CMD} -e "s#-O2##" ${WRKSRC}/configure
	@${REINPLACE_CMD} -e "s#%%PREFIX%%#${PREFIX}#g"		\
			${WRKSRC}/doc/example.conf		\
			${WRKSRC}/doc/example.efnet.conf
	@${REINPLACE_CMD} -e "s#%%LOGDIR%%#${LOGDIR}#g"		\
				${WRKSRC}/doc/example.conf	\
				${WRKSRC}/doc/example.efnet.conf
	@${REINPLACE_CMD} -e "s#%%RUNDIR%%#${RUNDIR}#g" ${WRKSRC}/include/config.h
	@${REINPLACE_CMD} -e "s#%%WRKSRC%%#${WRKSRC}#g" ${WRKSRC}/contrib/ircd-shortcut.pl

#-- ircd-shortcut.pl ratbox-services commands --------------------------------------

.if defined(SERVER_NAME)
	@${REINPLACE_CMD} -e "s#services.ircd-ratbox.org#${SERVER_NAME}#"       \
	${WRKSRC}/contrib/ircd-shortcut.pl
.endif
.if defined(USER_SERV)
	@${REINPLACE_CMD} -e "s#USERSERV#${USER_SERV}#" \
	${WRKSRC}/contrib/ircd-shortcut.pl
.endif
.if defined(CHAN_SERV)
	@${REINPLACE_CMD} -e "s#CHANSERV#${CHAN_SERV}#" \
	${WRKSRC}/contrib/ircd-shortcut.pl
.endif
.if defined(NICK_SERV)
	@${REINPLACE_CMD} -e "s#NICKSERV#${NICK_SERV}#" \
	${WRKSRC}/contrib/ircd-shortcut.pl
.endif
.if defined(ALIS_SERV)
	@${REINPLACE_CMD} -e "s#ALIS#${ALIS_SERV}#"     \
	${WRKSRC}/contrib/ircd-shortcut.pl
.endif
.if defined(OPER_BOT)
	@${REINPLACE_CMD} -e "s#OPERBOT#${OPER_BOT}#"   \
	${WRKSRC}/contrib/ircd-shortcut.pl
.endif
.if defined(OPER_SERV)
	@${REINPLACE_CMD} -e "s#OPERSERV#${OPER_SERV}#" \
	${WRKSRC}/contrib/ircd-shortcut.pl
.endif
.if defined(JUPE_SERV)
	@${REINPLACE_CMD} -e "s#JUPESERV#${JUPE_SERV}#" \
	${WRKSRC}/contrib/ircd-shortcut.pl
.endif
.if defined(GLOBAL_SERV)
	@${REINPLACE_CMD} -e "s#GLOBAL#${GLOBAL_SERV}#" \
	${WRKSRC}/contrib/ircd-shortcut.pl
.endif

#------ Execute ircd-shortcut perl script to generate the .c file. -----
	@${ECHO_MSG} "Executing ircd-shortcut.pl for ircd-shortcuts generation."
	${PERL} ${WRKSRC}/contrib/ircd-shortcut.pl

pre-su-install:
	${MKDIR} ${PREFIX}/etc/${PORTNAME}
	${MKDIR} ${DATADIR}/help
	${MKDIR} ${PREFIX}/lib/${PORTNAME}/modules

post-install:
	${CHOWN} -R ircd:ircd ${PREFIX}/etc/${PORTNAME}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/doc && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif
	${INSTALL_DATA} ${WRKSRC}/doc/ircd.motd ${PREFIX}/etc/${PORTNAME}/ircd.motd.sample
	${INSTALL_DATA} ${WRKSRC}/doc/example.conf ${PREFIX}/etc/${PORTNAME}/ircd.conf.sample
	${INSTALL_DATA} ${WRKSRC}/doc/example.efnet.conf ${PREFIX}/etc/${PORTNAME}/ircd-efnet.conf.sample

	@if [ ! -f ${PREFIX}/etc/${PORTNAME}/ircd.conf ]; then \
		${ECHO} "Installing default configuration file."; \
		${CP} -p ${PREFIX}/etc/${PORTNAME}/ircd.conf.sample ${PREFIX}/etc/${PORTNAME}/ircd.conf ; \
	fi

	@if [ ! -f ${PREFIX}/etc/${PORTNAME}/ircd.motd ]; then \
		${ECHO} "Installing default motd file."; \
		${CP} -p ${PREFIX}/etc/${PORTNAME}/ircd.motd.sample ${PREFIX}/etc/${PORTNAME}/ircd.motd ; \
	fi

	@${SETENV} "PKG_PREFIX=${PREFIX}" ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
	@${CAT} ${PKGMESSAGE}

#-----------------------------------------------------------------------

.include <bsd.port.post.mk>
