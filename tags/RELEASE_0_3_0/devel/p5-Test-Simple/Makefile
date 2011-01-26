# New ports collection makefile for:	p5-Test-Simple
# Date Created:				12 Aug 2001
# Whom:					Shell Hung <shell@shellhung.org>
#
# $FreeBSD: ports/devel/p5-Test-Simple/Makefile,v 1.26 2006/07/16 14:14:32 clsung Exp $
# $MidnightBSD: mports/devel/p5-Test-Simple/Makefile,v 1.2 2007/08/19 05:43:14 ctriv Exp $
#

PORTNAME=	Test-Simple
PORTVERSION=	0.86
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Test
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic utilities for writing tests in perl
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/Test/Harness.pm:${PORTSDIR}/devel/p5-Test-Harness
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3= 	Test::More.3 Test::Builder::Tester::Color.3 Test::Builder::Tester.3 \
	Test::Builder.3 Test::Simple.3 Test::Tutorial.3 Test::Builder::Module.3 

.include <bsd.port.mk>
