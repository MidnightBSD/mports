PORTNAME=	Math-Int64
PORTVERSION=	0.57
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manipulate 64 bits integers in Perl
WWW=		https://metacpan.org/release/Math-Int64

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/COPYING

USE_PERL5=	configure
USES=		perl5

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Math/Int64/Int64.so

.include <bsd.port.mk>
