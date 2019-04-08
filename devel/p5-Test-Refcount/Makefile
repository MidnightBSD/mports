PORTNAME=	Test-Refcount
PORTVERSION=	0.08
PORTREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assert reference counts on objects

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Devel-MAT>=0:devel/p5-Devel-MAT
TEST_DEPENDS=	p5-Test-Pod>=1:devel/p5-Test-Pod

USE_PERL5=	configure
USES=		perl5

.include <bsd.port.mk>
