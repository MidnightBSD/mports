PORTNAME=	Devel-PartialDump
PORTVERSION=	0.20
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Partial dumping of data structures, optimized for argument printing
WWW=		https://metacpan.org/release/Devel-PartialDump

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENCE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Tiny>=0:devel/p5-Class-Tiny \
		p5-Sub-Exporter>=0:devel/p5-Sub-Exporter \
		p5-namespace-clean>=0.20:devel/p5-namespace-clean
TEST_DEPENDS=	p5-Test-Warnings>=0.009:devel/p5-Test-Warnings

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
