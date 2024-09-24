PORTNAME=	meta
PORTVERSION=	0.008
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:PEVANS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Meta-programming API
WWW=		https://metacpan.org/dist/meta

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_gpl+ =	${WRKSRC}/LICENSE

TEST_DEPENDS=	p5-Test-Simple>=1.302200:devel/p5-Test-Simple

USES=		perl5
USE_PERL5=	modbuild

post-install:
#	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/meta/meta.so

.include <bsd.port.mk>
