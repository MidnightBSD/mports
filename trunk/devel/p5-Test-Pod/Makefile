# $MidnightBSD: mports/devel/p5-Test-Pod/Makefile,v 1.3 2010/11/13 16:35:58 laffer1 Exp $

PORTNAME=	Test-Pod
PORTVERSION=	1.45
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
