# $FreeBSD: ports/databases/p5-Data-Page/Makefile,v 1.9 2007/08/31 13:37:05 mat Exp $
# $MidnightBSD$

PORTNAME=	Data-Page
PORTVERSION=	2.02
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Module for paging thru result sets

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${SITE_PERL}/Class/Accessor/Chained.pm:devel/p5-Class-Accessor-Chained
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_MODBUILD=	yes

.include <bsd.port.mk>
