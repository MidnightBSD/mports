# $MidnightBSD$
# $FreeBSD: head/devel/p5-Devel-GlobalDestruction/Makefile 412346 2016-04-01 14:00:51Z mat $

PORTNAME=	Devel-GlobalDestruction
PORTVERSION=	0.13
PORTREVISION=	2
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Expose PL_dirty, the flag which marks global destruction

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Sub-Exporter-Progressive>=0.001011:${PORTSDIR}/devel/p5-Sub-Exporter-Progressive
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
