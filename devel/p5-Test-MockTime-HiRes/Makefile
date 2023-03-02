PORTNAME=	Test-MockTime-HiRes
PORTVERSION=	0.08
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Replaces actual time with simulated high resolution time
WWW=		https://metacpan.org/release/Test-MockTime-HiRes

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Test-MockTime>=0:devel/p5-Test-MockTime

USES=		perl5
USE_PERL5=	modbuildtiny

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
