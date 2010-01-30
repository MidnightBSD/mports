# New ports collection makefile for:	Bit-Vector
# Date created:				Mon Jan  1 10:37:30 2001
# Whom:					will
#
# $MidnightBSD: mports/math/p5-Bit-Vector/Makefile,v 1.2 2008/07/19 18:18:07 laffer1 Exp $
# $FreeBSD: ports/math/p5-Bit-Vector/Makefile,v 1.9 2006/01/05 06:16:32 tobez Exp $
#

PORTNAME=	Bit-Vector
PORTVERSION=	7.1
CATEGORIES=	math perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of advanced math functions that includes a Perl OO module
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/Carp/Clan.pm:${PORTSDIR}/devel/p5-Carp-Clan
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Bit::Vector.3 Bit::Vector::Overload.3 Bit::Vector::String.3

.include <bsd.port.mk>
