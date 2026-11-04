PORTNAME=	Text-Soundex
PORTVERSION=	3.05
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the soundex algorithm
WWW=		https://metacpan.org/release/Text-Soundex

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USE_PERL5=	configure
USES=		perl5

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Text/Soundex/Soundex.so

.include <bsd.port.mk>
