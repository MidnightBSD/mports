PORTNAME=	Test2-Plugin-Cover
PORTVERSION=	0.000027
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:EXODIST
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and Minimal file coverage info
WWW=		https://metacpan.org/release/Test2-Plugin-Cover

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Path-Tiny>=0.048:devel/p5-Path-Tiny
TEST_DEPENDS=	p5-Test2-Suite>=0.000130:devel/p5-Test2-Suite

USES=		perl5
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Test2/Plugin/Cover/Cover.so

.include <bsd.port.mk>
