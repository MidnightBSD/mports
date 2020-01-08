PORTNAME=	MaxMind-DB-Writer
PORTVERSION=	0.300003
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MAXMIND
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create MaxMind DB database files

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Data-Dumper-Concise>=0:devel/p5-Data-Dumper-Concise \
		p5-Data-IEEE754>=0:devel/p5-Data-IEEE754 \
		p5-Digest-SHA1>=0:security/p5-Digest-SHA1 \
		p5-Math-Int128>=0.21:math/p5-Math-Int128 \
		p5-Math-Int64>=0.51:math/p5-Math-Int64 \
		p5-MaxMind-DB-Common>=0:net/p5-MaxMind-DB-Common \
		p5-MaxMind-DB-Reader>=0:net/p5-MaxMind-DB-Reader \
		p5-Moose>=0:devel/p5-Moose \
		p5-MooseX-Params-Validate>=0:devel/p5-MooseX-Params-Validate \
		p5-MooseX-StrictConstructor>=0:devel/p5-MooseX-StrictConstructor \
		p5-Net-Works>=0:net/p5-Net-Works \
		p5-Sereal-Decoder>=0:converters/p5-Sereal-Decoder \
		p5-Sereal-Encoder>=3.002:converters/p5-Sereal-Encoder \
		p5-Test-Deep>=0:devel/p5-Test-Deep \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean

USE_PERL5=	modbuild
USES=		perl5

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/MaxMind/DB/Writer/Tree/Tree.so

.include <bsd.port.mk>
