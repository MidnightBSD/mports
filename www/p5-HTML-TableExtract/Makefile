PORTNAME=	HTML-TableExtract
PORTVERSION=	2.15
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extract text contained in tables within an HTML document
WWW=		https://metacpan.org/release/HTML-TableExtract

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTML-Element-Extended>=1.17:www/p5-HTML-Element-Extended \
		p5-HTML-Parser>=0:www/p5-HTML-Parser

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
