PORTNAME=	Unicode-Map8
PORTVERSION=	0.13
PORTREVISION=	3
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mapping table between 8-bit chars and Unicode

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Unicode-String>=2:converters/p5-Unicode-String

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Unicode/Map8/Map8.so

.include <bsd.port.mk>
