PORTNAME=	Class-DBI
PORTVERSION=	3.0.17
DISTVERSIONPREFIX=	v
PORTREVISION=	3
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple Database Abstraction
WWW=		https://metacpan.org/release/Class-DBI

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Accessor>=0:devel/p5-Class-Accessor \
		p5-Class-Data-Inheritable>=0:devel/p5-Class-Data-Inheritable \
		p5-Class-Trigger>=0:devel/p5-Class-Trigger \
		p5-Clone>=0:devel/p5-Clone \
		p5-Ima-DBI>=0:databases/p5-Ima-DBI \
		p5-UNIVERSAL-moniker>=0:devel/p5-UNIVERSAL-moniker
TEST_DEPENDS=	p5-DBD-SQLite>=0:databases/p5-DBD-SQLite

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
