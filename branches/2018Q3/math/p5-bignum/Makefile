# $MidnightBSD$

PORTNAME=	bignum
PORTVERSION=	0.32
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:FLORA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Transparent BigNumber/BigRational support for Perl
LICENSE=        perl

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501000
BUILD_DEPENDS+=	p5-Math-BigInt>=1.880:${PORTSDIR}/math/p5-Math-BigInt \
		p5-Math-BigRat>=0.21:${PORTSDIR}/math/p5-Math-BigRat
RUN_DEPENDS+=	p5-Math-BigInt>=1.880:${PORTSDIR}/math/p5-Math-BigInt \
		p5-Math-BigRat>=0.21:${PORTSDIR}/math/p5-Math-BigRat
.endif

.include <bsd.port.post.mk>
