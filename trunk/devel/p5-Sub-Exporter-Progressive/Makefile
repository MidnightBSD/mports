# $MidnightBSD$
# $FreeBSD: head/devel/p5-Sub-Exporter-Progressive/Makefile 412346 2016-04-01 14:00:51Z mat $

PORTNAME=	Sub-Exporter-Progressive
PORTVERSION=	0.001011
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Only use Sub::Exporter if you need it

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Sub-Exporter>=0:${PORTSDIR}/devel/p5-Sub-Exporter
RUN_DEPENDS:=	${BUILD_DEPENDS}

USE_PERL5=	configure
USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
