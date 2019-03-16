PORTNAME=	Net-HTTP
PORTVERSION=	6.18
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level HTTP client

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-IO-Socket-SSL>=1.38:security/p5-IO-Socket-SSL \
		p5-URI>=0:net/p5-URI
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
