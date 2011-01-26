# New ports collection makefile for:    p5-Test-Exception
# Date created:				January 27th 2003
# Whom:	      				Erwin Lansing <erwin@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Test-Exception/Makefile,v 1.1 2008/03/21 19:54:55 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Test-Exception/Makefile,v 1.17 2008/02/21 19:14:43 erwin Exp $
#

PORTNAME=	Test-Exception
PORTVERSION=	0.27
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test::Exception - test functions for exception based code
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Test/Builder/Tester.pm:${PORTSDIR}/devel/p5-Test-Simple \
		p5-Sub-Uplevel>=0.18:${PORTSDIR}/devel/p5-Sub-Uplevel
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Test::Exception.3

.include <bsd.port.mk>
