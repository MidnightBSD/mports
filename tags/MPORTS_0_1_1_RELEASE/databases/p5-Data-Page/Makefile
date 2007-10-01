# New ports collection makefile for:	p5-Data-Page
# Date created:	   21 july 2003
# Whom:		   Mathieu Arnold <m@absolight.net>
#
# $FreeBSD: ports/databases/p5-Data-Page/Makefile,v 1.9 2007/08/31 13:37:05 mat Exp $
# $MidnightBSD$
#

PORTNAME=	Data-Page
PORTVERSION=	2.00
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Module for paging thru result sets
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Class/Accessor/Chained.pm:${PORTSDIR}/devel/p5-Class-Accessor-Chained
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_MODBUILD=	yes

MAN3=		Data::Page.3

.include <bsd.port.mk>
