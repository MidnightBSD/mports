PORTNAME=	Test-POE-Client-TCP
PORTVERSION=	1.26
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	POE Component providing TCP client services for test cases
WWW=		https://metacpan.org/release/Test-POE-Client-TCP

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-POE>=1.28:devel/p5-POE

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
