# New ports collection makefile for:	devel/p5-Test-ClassAPI
# Date created:				24 March 2005
# Whom:					Lars Thegler <lth@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Test-ClassAPI/Makefile,v 1.1 2008/03/21 20:39:51 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Test-ClassAPI/Makefile,v 1.3 2007/03/12 18:29:05 lth Exp $
#

PORTNAME=	Test-ClassAPI
PORTVERSION=	1.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	Test
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides basic first-pass API testing for large class trees
LICENSE=	perl

RUN_DEPENDS=	p5-Class-Inspector>=1.12:${PORTSDIR}/devel/p5-Class-Inspector \
		p5-Config-Tiny>=2.00:${PORTSDIR}/devel/p5-Config-Tiny \
		p5-Params-Util>=0.10:${PORTSDIR}/devel/p5-Params-Util
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	Test::ClassAPI.3

.include <bsd.port.mk>
