PORTNAME=	MaxMind-DB-Reader-XS
PORTVERSION=	1.000007
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MAXMIND
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast XS implementation of MaxMind DB reader

LICENSE=	artistic2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
LIB_DEPENDS=	libmaxminddb.so:net/libmaxminddb
RUN_DEPENDS=	p5-Math-Int128>=0:math/p5-Math-Int128 \
		p5-Math-Int64>=0:math/p5-Math-Int64 \
		p5-MaxMind-DB-Common>=0.040001:net/p5-MaxMind-DB-Common \
		p5-MaxMind-DB-Reader>=1.000012:net/p5-MaxMind-DB-Reader \
		p5-Moo>=0:devel/p5-Moo \
		p5-namespace-autoclean>=0:devel/p5-namespace-autoclean

USES=		compiler:c11 perl5
USE_PERL5=	modbuild

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/MaxMind/DB/Reader/XS/XS.so

.include <bsd.port.mk>
