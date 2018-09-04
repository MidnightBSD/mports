# $MidnightBSD$

PORTNAME=	Class-C3-Componentised
PORTVERSION=	1.001002
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Load mix-ins or components to your C3-based class

LICENSE=	perl

BUILD_DEPENDS=	p5-Class-C3>=0.20:devel/p5-Class-C3 \
		p5-Class-Inspector>=1.32:devel/p5-Class-Inspector \
		p5-MRO-Compat>=0.09:devel/p5-MRO-Compat
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Test-Exception>=0.31:devel/p5-Test-Exception

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=       yes

.include <bsd.port.mk>
