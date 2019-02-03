# $MidnightBSD$
# $FreeBSD: ports/math/p5-Math-BigRat/Makefile,v 1.5 2007/05/27 11:34:57 skv Exp $

PORTNAME=	Math-BigRat
PORTVERSION=	0.26.02
PORTREVISION=	1
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Arbitrary big rational numbers
LICENSE=	perl

BUILD_DEPENDS=	p5-Math-BigInt>=1.991:${PORTSDIR}/math/p5-Math-BigInt
RUN_DEPENDS=	p5-Math-BigInt>=1.991:${PORTSDIR}/math/p5-Math-BigInt

PERL_CONFIGURE=	yes

post-patch:
	@${REINPLACE_CMD} -e '/INSTALLDIRS/d' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
