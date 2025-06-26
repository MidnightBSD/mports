PORTNAME=	Date-Simple
PORTVERSION=	3.03
PORTREVISION=	2
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple date object
WWW=		https://metacpan.org/release/Date-Simple

LICENSE=	artistic gpl2+
LICENSE_COMB=	dual
LICENSE_FILE_gpl2+ =	${WRKSRC}/COPYING

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Date/Simple/Simple.so

.include <bsd.port.mk>
