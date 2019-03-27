PORTNAME=	Ref-Util-XS
PORTVERSION=	0.117
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility functions for checking references (XS version)

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_PERL5=	configure
USES=		perl5

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Ref/Util/XS/XS.so

.include <bsd.port.mk>
