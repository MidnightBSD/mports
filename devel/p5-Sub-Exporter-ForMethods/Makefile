PORTNAME=	Sub-Exporter-ForMethods
PORTVERSION=	0.100055
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helper routines for using Sub::Exporter to build methods
WWW=		https://metacpan.org/release/Sub-Exporter-ForMethods

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Sub-Exporter>=0.978:devel/p5-Sub-Exporter
TEST_DEPENDS=	p5-namespace-autoclean>=0:devel/p5-namespace-autoclean

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
