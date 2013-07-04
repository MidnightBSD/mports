# $MidnightBSD: mports/math/p5-bignum/Makefile,v 1.5 2010/01/30 15:31:21 laffer1 Exp $

PORTNAME=	bignum
PORTVERSION=	0.30
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:FLORA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Transparent BigNumber/BigRational support for Perl
LICENSE=        perl

PERL_CONFIGURE=	yes

MAN3=		bigint.3 \
		bignum.3 \
		bigrat.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501000
BUILD_DEPENDS+=	p5-Math-BigInt>=1.880:${PORTSDIR}/math/p5-Math-BigInt \
		p5-Math-BigRat>=0.21:${PORTSDIR}/math/p5-Math-BigRat
RUN_DEPENDS+=	p5-Math-BigInt>=1.880:${PORTSDIR}/math/p5-Math-BigInt \
		p5-Math-BigRat>=0.21:${PORTSDIR}/math/p5-Math-BigRat
.endif

.include <bsd.port.post.mk>
