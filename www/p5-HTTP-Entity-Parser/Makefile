PORTNAME=	HTTP-Entity-Parser
PORTVERSION=	0.25
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PSGI compliant HTTP Entity Parser
WWW=		https://search.mcpan.org/dist/HTTP-Entity-Parser/

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-JSON-MaybeXS>=0:converters/p5-JSON-MaybeXS \
		p5-WWW-Form-UrlEncoded>=0.23:www/p5-WWW-Form-UrlEncoded \
		p5-HTTP-MultiPartParser>=0:www/p5-HTTP-MultiPartParser \
		p5-Hash-MultiValue>=0:devel/p5-Hash-MultiValue \
		p5-Stream-Buffered>=0:devel/p5-Stream-Buffered

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	modbuildtiny

.include <bsd.port.mk>
