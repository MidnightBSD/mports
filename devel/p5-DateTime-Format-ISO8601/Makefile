PORTNAME=	DateTime-Format-ISO8601
PORTVERSION=	0.16
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse ISO8601 formats
WWW=		https://metacpan.org/release/DateTime-Format-ISO8601

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=1.45:devel/p5-DateTime \
		p5-DateTime-Format-Builder>=0.77:devel/p5-DateTime-Format-Builder \
		p5-Params-ValidationCompiler>=0.26:devel/p5-Params-ValidationCompiler \
		p5-Specio>=0.18:devel/p5-Specio \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

PORTSCOUT=	skipv:0.0401,0.0402,0.0403

.include <bsd.port.mk>
