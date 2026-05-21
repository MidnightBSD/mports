PORTNAME=	Crypt-URandom
PORTVERSION=	0.54
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DDICK
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension to provide non-blocking randomness
WWW=		https://metacpan.org/release/Crypt-URandom

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	p5-Test-Pod>=1.14:devel/p5-Test-Pod

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${TRUE_PREFIX}/${SITE_ARCH_REL}/auto/Crypt/URandom/URandom.so

.include <bsd.port.mk>
