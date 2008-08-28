# New ports collection makefile for:	p5-chart
# Date Created:		8 April 1998
# Whom:			Vanilla I. Shu <vanilla@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/graphics/p5-chart/Makefile,v 1.25 2006/04/11 15:04:30 mat Exp $
#

PORTNAME=	Chart
PORTVERSION=	2.4.1
CATEGORIES=	graphics perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Chart
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A perl5 interface to build chart graphics

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/GD.pm:${PORTSDIR}/graphics/p5-GD

PERL_CONFIGURE=	yes

MAN3=		Chart.3

.include <bsd.port.mk>
