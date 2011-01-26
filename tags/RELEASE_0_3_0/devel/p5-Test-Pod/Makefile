# New ports collection makefile for:	p5-Test-Pod
# Date created:	   2 july 2003
# Whom:		   Mathieu Arnold <m@absolight.net>
#
# $MidnightBSD: mports/devel/p5-Test-Pod/Makefile,v 1.2 2008/10/16 21:45:17 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Test-Pod/Makefile,v 1.16 2007/09/08 00:59:11 linimon Exp $
#

PORTNAME=	Test-Pod
PORTVERSION=	1.44
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Check for POD errors in files
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Pod/Simple.pm:${PORTSDIR}/textproc/p5-Pod-Simple
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_MODBUILD=	yes

MAN3=		Test::Pod.3

.include <bsd.port.mk>
