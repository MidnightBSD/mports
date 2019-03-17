# $MidnightBSD$

PORTNAME=	GD-Graph
PORTVERSION=	1.54
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	GDGraph-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph plotting module for perl5

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-GD>=0:graphics/p5-GD \
		p5-GD-TextUtil>=0:graphics/p5-GD-TextUtil
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Capture-Tiny>=0:devel/p5-Capture-Tiny \
		p5-Test-Exception>=0.40:devel/p5-Test-Exception

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
