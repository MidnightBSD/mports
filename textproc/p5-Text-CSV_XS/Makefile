PORTNAME=	Text-CSV_XS
DISTVERSION=	1.48
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:HMBRAND
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Comma-separated values manipulation routines

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/README

TEST_DEPENDS=	p5-Test-Pod-Coverage>=1.10:devel/p5-Test-Pod-Coverage \
		p5-Test-Pod>=1.51:devel/p5-Test-Pod

USES=		perl5 tar:tgz
USE_PERL5=	configure

post-install:
		${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/Text/CSV_XS/CSV_XS.so

.include <bsd.port.mk>
