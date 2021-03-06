# New ports collection makefile for:    sudo
# Date created:         Sun Aug 13 12:36:14 CDT 1995
# Whom:                 erich@rrnet.com
#
# $FreeBSD$
#

PORTNAME=	sudo
PORTVERSION=	1.8.3
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_SUDO}
DISTNAME=	sudo-${PORTVERSION}p1

MAINTAINER=	wxs@FreeBSD.org
COMMENT=	Allow others to run commands as root

MAKE_JOBS_SAFE=	yes
GNU_CONFIGURE=	yes

CONFIGURE_ARGS=	--sysconfdir=${PREFIX}/etc \
		--with-ignore-dot \
		--with-tty-tickets \
		--with-env-editor \
		--with-logincap \
		--with-long-otp-prompt \
		--with-pam

OPTIONS=	LDAP "With LDAP support" off \
		INSULTS "With all insults" off \
		DISABLE_ROOT_SUDO "Disable root sudo" off \
		DISABLE_AUTH "Disable authentication" off \
		NOARGS_SHELL "Enable no arguments shell" off \
		AUDIT "Enable BSM audit support" on

LOGFAC?=	local2
CONFIGURE_ARGS+=	--with-logfac=${LOGFAC}

.include <bsd.port.options.mk>

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
LDFLAGS+=	-L${LOCALBASE}/lib -lintl
CFLAGS+=	-I${LOCALBASE}/include
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

# SUDO_SECURE_PATH is a PATH string that will override the user's PATH.
# ex: make SUDO_SECURE_PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"
.if defined(SUDO_SECURE_PATH)
CONFIGURE_ARGS+=	--with-secure-path="${SUDO_SECURE_PATH}"
.endif

.if defined(WITH_INSULTS)
CONFIGURE_ARGS+=	--with-insults
CONFIGURE_ARGS+=	--with-all-insults
.endif

.if defined(WITH_LDAP)
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=	--with-ldap=${PREFIX}
SUDO_LDAP_CONF?=	ldap.conf
CONFIGURE_ARGS+=	--with-ldap-conf-file=${PREFIX}/etc/${SUDO_LDAP_CONF}
PLIST_SUB+=	LDAP=""
MAN5+=	sudoers.ldap.5
.else
PLIST_SUB+=	LDAP="@comment "
.endif

.if defined(WITH_DISABLE_ROOT_SUDO)
CONFIGURE_ARGS+=--disable-root-sudo
.endif

.if defined(WITH_DISABLE_AUTH)
CONFIGURE_ARGS+=--disable-authentication
.endif

.if defined(WITH_NOARGS_SHELL)
CONFIGURE_ARGS+=--enable-noargs-shell
.endif

.if defined(WITH_AUDIT)
CONFIGURE_ARGS+=--with-bsm-audit
.endif

MAN5+=		sudoers.5
MAN8=		sudo.8 visudo.8 sudoreplay.8 sudo_plugin.8
MLINKS=		sudo.8 sudoedit.8

post-patch:
	@${REINPLACE_CMD} -E '/install-(binaries|noexec):/,/^$$/ \
		s/\$$\(INSTALL\)/& ${STRIP}/;s/-b\~/-b ~/' \
		${WRKSRC}/src/Makefile.in
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e 's/mkinstalldirs $$(DESTDIR)$$(docdir)/mkinstalldirs/' \
		${WRKSRC}/doc/Makefile.in
	@${REINPLACE_CMD} -e '/for f in $$(OTHER_DOCS); do/d;/@LDAP@for f in $$(OTHER_DOCS_LDAP); do/d' ${WRKSRC}/doc/Makefile.in
	@${REINPLACE_CMD} -e 's/$$(DESTDIR)$$(sudoersdir) $$(DESTDIR)$$(docdir)/$$(DESTDIR)$$(sudoersdir)/' ${WRKSRC}/plugins/sudoers/Makefile.in
.endif

post-install:
	${INSTALL_DATA} ${FILESDIR}/pam.conf ${PREFIX}/etc/pam.d/sudo.default
	if [ ! -f ${PREFIX}/etc/pam.d/sudo ]; then \
		${CP} -p ${PREFIX}/etc/pam.d/sudo.default \
		${PREFIX}/etc/pam.d/sudo ; \
	fi
	if [ ! -f ${PREFIX}/etc/sudoers ]; then \
		${CP} -p ${PREFIX}/etc/sudoers.sample ${PREFIX}/etc/sudoers; \
	fi
	${TOUCH} ${PREFIX}/etc/sudoers.d/.keep-me

.include <bsd.port.mk>
