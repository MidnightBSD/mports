PORTNAME=	Getopt-Yath
PORTVERSION=	2.000011
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:EXODIST
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Option processing yath style
WWW=		https://metacpan.org/dist/Getopt-Yath

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Cpanel-JSON-XS>=0:converters/p5-Cpanel-JSON-XS \
		p5-Importer>=0.024:devel/p5-Importer \
		p5-Term-Table>=0.028:devel/p5-Term-Table
TEST_DEPENDS=	p5-Test-Simple>=1.302200:devel/p5-Test-Simple

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
