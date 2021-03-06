# New ports collection makefile for:	Apache + mod_perl
# Date created:		May 21, 2004
# Whom:			ports@rbt.ca
#
# $FreeBSD$
#

PORTNAME=	apache+mod_perl
PORTVERSION=	${VERSION_APACHE}
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_APACHE_HTTPD:S/$/:apache/} \
		${MASTER_SITE_PERL_CPAN:S/$/Apache\/:modperl/}
DISTNAME=	apache_${VERSION_APACHE}
DISTFILES=	apache_${VERSION_APACHE}${EXTRACT_SUFX}:apache \
		mod_perl-${VERSION_MODPERL}${EXTRACT_SUFX}:modperl

MAINTAINER=	apache@FreeBSD.org
COMMENT=	The Apache 1.3 webserver with a statically embedded perl interpreter

LIB_DEPENDS+=	expat.6:${PORTSDIR}/textproc/expat2
BUILD_DEPENDS=	${SITE_PERL}/LWP.pm:${PORTSDIR}/www/p5-libwww
RUN_DEPENDS=	${BUILD_DEPENDS}

DEPRECATED=	apache13 is deprecated, migrate to 2.2.x+ now
EXPIRATION_DATE=	2011-11-01

MAKE_JOBS_SAFE=  yes

CONFLICTS=	apache-1.* apache+mod_ssl-1.* apache+mod_ssl+ipv6-1.* apache+mod_ssl+modsnmp-1.* \
		apache+mod_ssl+mod_snmp+ipv6-1.* apache+mod_ssl+mod_accel-1.* \
		apache+mod_ssl+mod_snmp+mod_accel-1.* \
		apache+ipv6-1.* apache+ssl-1.* apache-2.* apache_fp-1.* \
		caudium-devel-1.* caudium10-1.* caudium12-* \
		ru-apache+mod_ssl-1.* ru-apache-1.* apache-*-2.*

USE_PERL5=	YES
USE_RC_SUBR=	apache

DATADIR=	${PREFIX}/www
DOCUMENT_ROOT=	${DATADIR}/data
DEFAULT_PATH=	/bin:/usr/bin:${PREFIX}/bin

# Perl man pages go into section 3
MAN3PREFIX=	${PREFIX}/lib/perl5/${PERL_VERSION}

.include <bsd.port.pre.mk>

VERSION_APACHE=		1.3.42
VERSION_MODPERL=	1.30

WRKSRC_MODPERL=	${WRKDIR}/mod_perl-${VERSION_MODPERL}

.if defined(WITH_APACHE_SUEXEC)

APACHE_SUEXEC_DOCROOT?=${DOCUMENT_ROOT}
APACHE_SUEXEC_USERDIR?=public_html

SUEXEC_CONF=	--enable-suexec \
		--suexec-docroot=${APACHE_SUEXEC_DOCROOT} \
		--suexec-caller=www \
		--suexec-uidmin=1000 \
		--suexec-gidmin=1000 \
		--suexec-logfile=/var/log/httpd-suexec.log \
		--suexec-userdir=${APACHE_SUEXEC_USERDIR} \
		--suexec-safepath=${DEFAULT_PATH}

.if defined(APACHE_SUEXEC_UMASK)
SUEXEC_CONF+=	--suexec-umask=${APACHE_SUEXEC_UMASK}
.endif

PLIST_SUB+=	SUB_SUEXEC=""
SUEXEC_MAN=	suexec.8

.else   # !SUEXEC

SUEXEC_CONF=
PLIST_SUB+=	SUB_SUEXEC="@comment "
SUEXEC_MAN=

.endif  # !SUEXEC

HAS_CONFIGURE=	yes
CONFIGURE_ARGS+=--prefix=${PREFIX} \
		--server-uid=www \
		--server-gid=www \
		--with-perl=${PERL} \
		--with-layout=FreeBSD \
		--without-confadjust \
		--enable-module=most \
		--enable-module=auth_db \
		--enable-module=mmap_static \
		--disable-module=auth_dbm \
		--enable-shared=max \
		--activate-module=src/modules/perl/libperl.a \
		--enable-module=perl \
		${SUEXEC_CONF}

CFLAGS+=-DDOCUMENT_LOCATION=\\\\\"${DOCUMENT_ROOT}\\\\\" \
	-DDEFAULT_PATH=\\\\\"${DEFAULT_PATH}\\\\\"

#
# Set APACHE_HARD_SERVER_LIMIT env. variable to desired value
#
.if defined(APACHE_HARD_SERVER_LIMIT)
CFLAGS+=-DHARD_SERVER_LIMIT=${APACHE_HARD_SERVER_LIMIT}
.else
CFLAGS+=-DHARD_SERVER_LIMIT=2048
.endif

#
# Set WITH_APACHE_PERF_TUNING env. variable to yes to get maximum performance
#
.if defined(WITH_APACHE_PERF_TUNING)
CFLAGS+=	-DBUFFERED_LOGS
CFLAGS+=	-O6 -fomit-frame-pointer
.endif

.if defined(LARGEFILES)
OPTIM+=		-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
.endif

CFLAGS=		-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

CONFIGURE_ENV=	OPTIM='${OPTIM}' LIBS='${LIBS}'

MAN1=	dbmmanage.1 htdigest.1 htpasswd.1

MAN3=	Apache.3 Apache::Constants.3  Apache::ExtUtils.3 \
		Apache::FakeRequest.3 Apache::File.3 Apache::Leak.3 \
		Apache::Log.3 Apache::Options.3 \
		Apache::PerlRun.3 Apache::PerlRunXS.3 \
		Apache::RedirectLogFix.3 \
		Apache::Registry.3 Apache::SizeLimit.3 \
		Apache::Status.3 Apache::Symbol.3 Apache::Symdump.3 \
		Apache::Table.3 Apache::URI.3 Apache::Util.3 \
		Apache::fork.3 \
		Apache::httpd_conf.3 Apache::src.3 Apache::testold.3 \
		Bundle::Apache.3 \
		Apache::Debug.3 mod_perl.3 Apache::SIG.3 Apache::Resource.3 \
		Apache::RegistryLoader.3 Apache::StatINC.3 Apache::Include.3 \
		Apache::PerlSections.3 Apache::MyConfig.3 cgi_to_mod_perl.3 \
		mod_perl_cvs.3 mod_perl_method_handlers.3 mod_perl_traps.3 \
		mod_perl_tuning.3

MAN8=	ab.8 apachectl.8 apxs.8 httpd.8 logresolve.8 rotatelogs.8 \
		${SUEXEC_MAN}

pre-configure:
	@ cd ${WRKSRC_MODPERL}; \
	${PERL5} Makefile.PL EVERYTHING=1 APACHE_SRC=../apache_${VERSION_APACHE}\
		USE_APACI=1 PREP_HTTPD=1 DO_HTTPD=1

post-configure:
	@cd ${WRKSRC_MODPERL}/ && \
		${PERL5} -pi -e 's/ doc_(perl|site|\$$\(INSTALLDIRS\))_install$$//' Makefile

pre-build:
	@ cd ${WRKSRC_MODPERL}; \
	${MAKE}

pre-install:
	@ cd ${WRKSRC_MODPERL} ; \
	${MAKE} install

.include <bsd.port.post.mk>
