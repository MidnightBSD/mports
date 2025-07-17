PORTNAME=	Encode-CNMap
PORTVERSION=	0.32
PORTREVISION=	2
CATEGORIES=	chinese perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enhanced Chinese encodings with Simplified-Traditional auto-mapping
WWW=		https://metacpan.org/release/Encode-CNMap

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Encode/CNMap/CNMap.so

.include <bsd.port.mk>
