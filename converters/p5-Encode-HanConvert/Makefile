PORTNAME=	Encode-HanConvert
PORTVERSION=	0.35
CATEGORIES=	converters chinese perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Traditional and Simplified Chinese mappings

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Encode/HanConvert/HanConvert.so

.include <bsd.port.mk>
