PORTNAME=	Compress-Raw-Bzip2
PORTVERSION=	2.201
CATEGORIES=	archivers perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-Level Interface to bzip2 compression library
WWW=		https://metacpan.org/release/Compress-Raw-Bzip2

LICENSE=	artistic gpl
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-Test-Pod>=1:devel/p5-Test-Pod

USE_PERL5=	configure
USES=		perl5

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Compress/Raw/Bzip2/Bzip2.so

.include <bsd.port.mk>
