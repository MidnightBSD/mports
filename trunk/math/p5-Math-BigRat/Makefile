# New ports collection makefile for:	Math-BigRat
# Date created:	   03 March 2005
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $MidnightBSD: mports/math/p5-Math-BigRat/Makefile,v 1.2 2007/07/22 08:16:37 laffer1 Exp $
# $FreeBSD: ports/math/p5-Math-BigRat/Makefile,v 1.5 2007/05/27 11:34:57 skv Exp $
#

PORTNAME=	Math-BigRat
PORTVERSION=	0.22
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	Math
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Arbitrary big rational numbers
LICENSE=	perl

BUILD_DEPENDS=	p5-Math-BigInt>=1.88:${PORTSDIR}/math/p5-Math-BigInt
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_MODBUILD=	yes

MAN3=		Math::BigRat.3

post-patch:
	@${REINPLACE_CMD} -e '/INSTALLDIRS/d' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
