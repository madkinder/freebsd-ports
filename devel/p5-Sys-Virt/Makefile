# New ports collection makefile for:	Sys::Virt
# Date created:		Nov 21 2011
# Whom:			Frank Wall <fw@moov.de>
#
# $FreeBSD$
#

PORTNAME=	Sys-Virt
PORTVERSION=	0.9.7
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	fw@moov.de
COMMENT=	Perl bindings for libvirt

# NOTE: Sys::Virt's versioning scheme follows libvirt.
BUILD_DEPENDS=	libvirt>=${PORTVERSION}:${PORTSDIR}/devel/libvirt \
		p5-XML-XPath>=0:${PORTSDIR}/textproc/p5-XML-XPath
RUN_DEPENDS=	libvirt>=${PORTVERSION}:${PORTSDIR}/devel/libvirt \
		p5-XML-XPath>=0:${PORTSDIR}/textproc/p5-XML-XPath

PERL_CONFIGURE=	yes

MAN3=		Sys::Virt.3 \
		Sys::Virt::Domain.3 \
		Sys::Virt::DomainSnapshot.3 \
		Sys::Virt::Error.3 \
		Sys::Virt::Event.3 \
		Sys::Virt::Interface.3 \
		Sys::Virt::NWFilter.3 \
		Sys::Virt::Network.3 \
		Sys::Virt::NodeDevice.3 \
		Sys::Virt::Secret.3 \
		Sys::Virt::StoragePool.3 \
		Sys::Virt::StorageVol.3 \
		Sys::Virt::Stream.3

.include <bsd.port.mk>
