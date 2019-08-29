# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	Type-Tiny
PORTVERSION=	1.004004
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:TOBYINK
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny, yet Moo(se)-compatible type constraint

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Exporter-Tiny>=0.026:devel/p5-Exporter-Tiny

OPTIONS_DEFINE=	RECOMMENDED
OPTIONS_DEFAULT=RECOMMENDED
RECOMMENDED_DESC=	Recommended dependencies by upstream

PORTSCOUT=	limit:^[0-9\.]*$$

NO_ARCH=	yes
NO_TEST=	yes
USE_PERL5=	configure
USES=		perl5

RECOMMENDED_BUILD_DEPENDS=	p5-Devel-StackTrace>=0:devel/p5-Devel-StackTrace \
				p5-Ref-Util-XS>=0.100:devel/p5-Ref-Util-XS \
				p5-Type-Tie>=0:devel/p5-Type-Tie \
				p5-Type-Tiny-XS>=0.011:devel/p5-Type-Tiny-XS
RECOMMENDED_RUN_DEPENDS=	p5-Devel-StackTrace>=0:devel/p5-Devel-StackTrace \
				p5-Ref-Util-XS>=0.100:devel/p5-Ref-Util-XS \
				p5-Type-Tie>=0:devel/p5-Type-Tie \
				p5-Type-Tiny-XS>=0.011:devel/p5-Type-Tiny-XS

.include <bsd.port.mk>
