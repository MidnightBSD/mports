PORTNAME=	GD-Graph
PORTVERSION=	1.56
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	GDGraph-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graph plotting module for perl5
WWW=		https://metacpan.org/release/GDGraph

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-GD>=0:graphics/p5-GD \
		p5-GD-TextUtil>=0:graphics/p5-GD-TextUtil
RUN_DEPENDS:=	${BUILD_DEPENDS}

NO_ARCH=	yes
NO_TEST=	yes

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
