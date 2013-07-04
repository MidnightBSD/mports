# New ports collection makefile for:	p5-GD-TextUtil
# Date created:				21 February 2000
# Whom:	      				Dmitry Sivachenko <dima@Chg.RU>
#
# $MidnightBSD: mports/graphics/p5-GD-TextUtil/Makefile,v 1.2 2008/10/13 20:47:39 laffer1 Exp $
# $FreeBSD: ports/graphics/p5-GD-TextUtil/Makefile,v 1.13 2003/10/24 12:02:28 ijliao Exp $
#

PORTNAME=	GD-TextUtil
PORTVERSION=	0.86
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	GDTextUtil-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text utilities for use with GD drawing package
LICENSE=	gpl2

RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/GD.pm:${PORTSDIR}/graphics/p5-GD

MAKE_JOBS_SAFE=  yes
PERL_CONFIGURE=	YES

MAN3=		GD::Text.3 GD::Text::Wrap.3 GD::Text::Align.3

.include <bsd.port.mk>
