PORTNAME=	Type-Tiny-XS
PORTVERSION=	0.014
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:TOBYINK
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny, yet Moo(se)-compatible type constraint

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_PERL5=	configure
USES=		perl5

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Type/Tiny/XS/XS.so

.include <bsd.port.mk>
