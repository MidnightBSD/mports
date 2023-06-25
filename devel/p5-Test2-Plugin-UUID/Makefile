PORTNAME=	Test2-Plugin-UUID
PORTVERSION=	0.002001
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:EXODIST
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Use REAL UUIDs in Test2
WWW=		https://metacpan.org/release/Test2-Plugin-UUID

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Data-UUID>=1.148:devel/p5-Data-UUID
TEST_DEPENDS=	p5-Test2-Suite>=0.000124:devel/p5-Test2-Suite

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes

.include <bsd.port.mk>
