PORTNAME=	POE-Component-Server-HTTP
PORTVERSION=	0.09
CATEGORIES=	www devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	POE Component to create HTTP Servers
WWW=		https://metacpan.org/release/POE-Component-Server-HTTP

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-POE>=0:devel/p5-POE \
		p5-POE-API-Peek>=0:devel/p5-POE-API-Peek \
		p5-YAML>=0:textproc/p5-YAML \
		p5-libwww>=0:www/p5-libwww

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
