PORTNAME=	Test-File-ShareDir
PORTVERSION=	1.001002
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create a fake ShareDir for your modules for testing

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-Tiny>=0:devel/p5-Class-Tiny \
		p5-File-Copy-Recursive>=0:devel/p5-File-Copy-Recursive \
		p5-File-ShareDir>=1.00:devel/p5-File-ShareDir \
		p5-Path-Tiny>=0.018:devel/p5-Path-Tiny \
		p5-Scope-Guard>=0:devel/p5-Scope-Guard
TEST_DEPENDS=	p5-Test-Fatal>=0:devel/p5-Test-Fatal

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
