# New ports collection makefile for:	ExtUtils::ParseXS
# Date created:				29 June 2003
# Whom:                			Dmitry Sivachenko <demon@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/p5-ExtUtils-ParseXS/Makefile,v 1.8 2006/12/23 14:07:18 demon Exp $
#

PORTNAME=	ExtUtils-ParseXS
PORTVERSION=	2.17
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	ExtUtils
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts Perl XS code into C code
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/ExtUtils/CBuilder.pm:${PORTSDIR}/devel/p5-ExtUtils-CBuilder
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
