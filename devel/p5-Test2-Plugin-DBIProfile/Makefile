PORTNAME=	Test2-Plugin-DBIProfile
PORTVERSION=	0.002006
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:EXODIST
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Plugin to enable and display DBI profiling
WWW=		https://metacpan.org/release/Test2-Plugin-DBIProfile

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		perl5
USE_PERL5=	configure

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Test2-Suite>=0.000126:devel/p5-Test2-Suite
TEST_DEPENDS=	p5-DBD-SQLite>=1.44:databases/p5-DBD-SQLite

NO_ARCH=	yes

.include <bsd.port.mk>
