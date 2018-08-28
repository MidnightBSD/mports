# $MidnightBSD$

PORTNAME=	Net-Server
PORTVERSION=	2.008
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configurable base class for writing internet servers in Perl

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-IO-Multiplex>=1.01:${PORTSDIR}/devel/p5-IO-Multiplex
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS_DEFINE=	IPV6

PERL_CONFIGURE=	yes

IPV6_BUILD_DEPENDS=	p5-Socket6>=0.23:${PORTSDIR}/net/p5-Socket6
IPV6_RUN_DEPENDS=	p5-Socket6>=0.23:${PORTSDIR}/net/p5-Socket6

.include <bsd.port.mk>
