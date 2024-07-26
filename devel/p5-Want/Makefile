PORTNAME=	Want
PORTVERSION=	0.29
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:ROBIN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generalisation of wantarray
WWW=		https://metacpan.org/release/Want

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Want/Want.so

.include <bsd.port.mk>
