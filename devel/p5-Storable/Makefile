PORTNAME=	Storable
PORTVERSION=	3.25
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Persistency for perl data structures
WWW=		https://metacpan.org/release/Storable

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USES+=	cpe
CPE_VENDOR=	nwclark
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Storable/Storable.so

.include <bsd.port.mk>
