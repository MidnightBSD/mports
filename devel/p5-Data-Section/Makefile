PORTNAME=	Data-Section
PORTVERSION=	0.200008
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Read multiple hunks of data out of your DATA section

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-MRO-Compat>=0.09:devel/p5-MRO-Compat \
		p5-Sub-Exporter>=0.979:devel/p5-Sub-Exporter
TEST_DEPENDS=	p5-Test-FailWarnings>=0:devel/p5-Test-FailWarnings

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
