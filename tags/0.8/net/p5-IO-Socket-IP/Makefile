# $MidnightBSD$

PORTNAME=	IO-Socket-IP
PORTVERSION=	0.37
CATEGORIES=	net ipv6 perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Drop-in replacement for IO::Socket::INET supporting IPv4 and IPv6

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Socket>=1.97:${PORTSDIR}/net/p5-Socket
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Pod>=1:${PORTSDIR}/devel/p5-Test-Pod

PERL_CONFIGURE=	yes
USES=		perl5

.include <bsd.port.mk>
