PORTNAME=	JSON-XS
PORTVERSION=	4.03
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON serialising/deserialising, done correctly and fast
WWW=		https://metacpan.org/release/JSON-XS

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Types-Serialiser>=0:devel/p5-Types-Serialiser \
		p5-common-sense>0:devel/p5-common-sense

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/JSON/XS/XS.so

.include <bsd.port.mk>
