PORTNAME=	HTTP-Daemon
PORTVERSION=	6.14
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple HTTP server class
WWW=		https://metacpan.org/release/HTTP-Daemon

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENCE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-HTTP-Date>=6:www/p5-HTTP-Date \
		p5-HTTP-Message>=6:www/p5-HTTP-Message \
		p5-LWP-MediaTypes>=6:www/p5-LWP-MediaTypes
TEST_DEPENDS=	p5-Test-Needs>=0:devel/p5-Test-Needs

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
