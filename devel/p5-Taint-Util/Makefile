PORTNAME=	Taint-Util
PORTVERSION=	0.08
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test for and flip the taint flag without regex matches or eval
WWW=		https://metacpan.org/release/Taint-Util

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Taint/Util/Util.so

.include <bsd.port.mk>
