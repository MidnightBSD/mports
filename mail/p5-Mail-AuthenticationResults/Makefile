PORTNAME=	Mail-AuthenticationResults
PORTVERSION=	2.20210915
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Object Oriented Authentication-Results Headers
WWW=		https://metacpan.org/release/Mail-AuthenticationResults

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Clone>=0:devel/p5-Clone \
		p5-JSON>=0:converters/p5-JSON

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
