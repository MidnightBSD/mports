# $MidnightBSD: mports/graphics/p5-chart/Makefile,v 1.1 2007/03/11 05:35:04 laffer1 Exp $

PORTNAME=	Chart
PORTVERSION=	2.4.1
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A perl5 interface to build chart graphics
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/GD.pm:${PORTSDIR}/graphics/p5-GD

PERL_CONFIGURE=	yes

MAN3=		Chart.3

.include <bsd.port.mk>
