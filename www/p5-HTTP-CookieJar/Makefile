PORTNAME=	HTTP-CookieJar
PORTVERSION=	0.014
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Minimalist HTTP user agent cookie jar
WWW=		https://metacpan.org/release/HTTP-CookieJar

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTTP-Date>=0:www/p5-HTTP-Date
TEST_DEPENDS=	p5-HTTP-Message>=0:www/p5-HTTP-Message \
		p5-Mozilla-PublicSuffix>=0:dns/p5-Mozilla-PublicSuffix \
		p5-Test-Deep>=0:devel/p5-Test-Deep \
		p5-Test-Requires>=0:devel/p5-Test-Requires \
		p5-Test-Simple>=0.96:devel/p5-Test-Simple

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
