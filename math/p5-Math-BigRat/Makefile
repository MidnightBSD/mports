PORTNAME=	Math-BigRat
PORTVERSION=	0.26.14
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Arbitrary big rational numbers

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 502503
BUILD_DEPENDS+=	p5-Math-BigInt>=1.999718:math/p5-Math-BigInt
RUN_DEPENDS+=	p5-Math-BigInt>=1.999718:math/p5-Math-BigInt
.endif

.include <bsd.port.post.mk>
