PORTNAME=	Net-Server
PORTVERSION=	2.014
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configurable base class for writing internet servers in Perl
WWW=		https://metacpan.org/release/Net-Server

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-IO-Multiplex>=1.05:devel/p5-IO-Multiplex

OPTIONS_DEFINE=	IPV6

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

IPV6_BUILD_DEPENDS=	p5-IO-Socket-INET6>=0:net/p5-IO-Socket-INET6 \
			p5-Socket6>=0.23:net/p5-Socket6
IPV6_RUN_DEPENDS=	p5-IO-Socket-INET6>=0:net/p5-IO-Socket-INET6 \
			p5-Socket6>=0.23:net/p5-Socket6

.include <bsd.port.mk>
