# $MidnightBSD$

PORTNAME=	Math-Base36
PORTVERSION=	0.07
CATEGORIES=	math perl5 converters
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Encoding and decoding of base36 strings
LICENSE=perl

BUILD_DEPENDS=	p5-Math-BigInt>=1.60:${PORTSDIR}/math/p5-Math-BigInt
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Math::Base36.3

.include <bsd.port.mk>
