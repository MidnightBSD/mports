PORTNAME=	B-COW
PORTVERSION=	0.007
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD>org
COMMENT=	Additional B helpers to check COW status
WWW=		https://metacpan.org/release/B-COW

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/B/COW/COW.so

.include <bsd.port.mk>
