PORTNAME=	DateTime
PORTVERSION=	1.65
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Date and time object
WWW=		https://metacpan.org/release/DateTime

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

# Do not add p5-DateTime-Format-Strptime>=1.20.00 to TEST_DEPENDS to avoid cyclic dependency
BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime-Locale>=1.06:devel/p5-DateTime-Locale \
		p5-DateTime-TimeZone>=2.02:devel/p5-DateTime-TimeZone \
		p5-Params-Validate>=1.03:devel/p5-Params-Validate \
		p5-Params-ValidationCompiler>=0.26:devel/p5-Params-ValidationCompiler \
		p5-Specio>=0:devel/p5-Specio \
		p5-Try-Tiny>=0:lang/p5-Try-Tiny \
		p5-namespace-autoclean>=0.19:devel/p5-namespace-autoclean
TEST_DEPENDS=	p5-Test-Fatal>=0:devel/p5-Test-Fatal \
		p5-CPAN-Meta-Check>=0.011:devel/p5-CPAN-Meta-Check \
		p5-Test-Warnings>=0.005:devel/p5-Test-Warnings

USES=		perl5
USE_PERL5=	configure

# magus
NO_TEST=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/DateTime/DateTime.so

.include <bsd.port.mk>
