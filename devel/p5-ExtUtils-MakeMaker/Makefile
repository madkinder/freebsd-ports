# New ports collection makefile for:    ExtUtils-MakeMaker
# Date created:                         Mon Feb 23 00:13:01 EST 2004
# Whom:                                 Michael Johnson <ahze@ahze.net>
#
# $FreeBSD$
#

PORTNAME=	ExtUtils-MakeMaker
PORTVERSION=	6.56
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Designed to write a Makefile for an extension module

CONFLICTS=	p5-ExtUtils-Install-[0-9]*

PERL_CONFIGURE=	yes

MAN3=		ExtUtils::Command.3 ExtUtils::Command::MM.3 ExtUtils::Install.3 \
		ExtUtils::Installed.3 ExtUtils::Liblist.3 ExtUtils::MM.3 \
		ExtUtils::MM_AIX.3 ExtUtils::MM_Any.3 ExtUtils::MM_BeOS.3 \
		ExtUtils::MM_Cygwin.3 ExtUtils::MM_DOS.3 ExtUtils::MM_Darwin.3 \
		ExtUtils::MM_MacOS.3 ExtUtils::MM_NW5.3 ExtUtils::MM_OS2.3 \
		ExtUtils::MM_QNX.3 ExtUtils::MM_UWIN.3 ExtUtils::MM_Unix.3 \
		ExtUtils::MM_VMS.3 ExtUtils::MM_VOS.3 ExtUtils::MM_Win32.3 \
		ExtUtils::MM_Win95.3 ExtUtils::MY.3 ExtUtils::MakeMaker.3 \
		ExtUtils::MakeMaker::Config.3 ExtUtils::MakeMaker::FAQ.3 \
		ExtUtils::MakeMaker::Tutorial.3 ExtUtils::Manifest.3 \
		ExtUtils::Mkbootstrap.3 ExtUtils::Mksymlists.3 \
		ExtUtils::Packlist.3 ExtUtils::testlib.3

post-patch:
	@${REINPLACE_CMD} -e '/EXE_FILES/d' ${WRKSRC}/Makefile.PL
	@[ -e ${LOCALBASE}/lib/perl5/${PERL_VERSION}/mach/CORE/cc_runtime.h ] || \
		${SED} -i '' -e '/cc_runtime.h/d' ${WRKSRC}/lib/ExtUtils/MM_Unix.pm

.include <bsd.port.mk>
