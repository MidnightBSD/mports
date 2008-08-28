# New ports collection makefile for:	p5-Test-Pod
# Date created:	   2 july 2003
# Whom:		   Mathieu Arnold <m@absolight.net>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Test-Pod/Makefile,v 1.16 2007/09/08 00:59:11 linimon Exp $
#

PORTNAME=	Test-Pod
PORTVERSION=	1.26
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Test
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Check for POD errors in files

BUILD_DEPENDS=	${SITE_PERL}/Test/Builder/Tester.pm:${PORTSDIR}/devel/p5-Test-Simple \
		${SITE_PERL}/Pod/Simple.pm:${PORTSDIR}/textproc/p5-Pod-Simple
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Test::Pod.3

.include <bsd.port.mk>
