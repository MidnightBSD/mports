PORTNAME=	MooseX-Types-JSON
PORTVERSION=	1.01
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MILA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON and relaxedJSON datatype for Moose
WWW=		https://metacpan.org/release/MooseX-Types-JSON

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-JSON>=2.00:converters/p5-JSON \
		p5-Moose>=0.82:devel/p5-Moose \
		p5-MooseX-Types>=0.15:devel/p5-MooseX-Types
TEST_DEPENDS=	p5-Test-Pod>=1.00:devel/p5-Test-Pod

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
