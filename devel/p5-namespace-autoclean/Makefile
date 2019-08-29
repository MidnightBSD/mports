# Created by: Sergey Skvortsov <skv@protey.ru>

PORTNAME=	namespace-autoclean
PORTVERSION=	0.28
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Keep imports out of your namespace

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-B-Hooks-EndOfScope>=0.12:devel/p5-B-Hooks-EndOfScope \
		p5-Sub-Identify>=0:devel/p5-Sub-Identify \
		p5-namespace-clean>=0.20:devel/p5-namespace-clean

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
