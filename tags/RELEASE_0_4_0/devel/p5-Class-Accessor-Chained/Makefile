# New ports collection makefile for:	devel/p5-Class-Accessor-Chained
# Date created:				03 November 2004
# Whom:					mat
#
# $FreeBSD: ports/devel/p5-Class-Accessor-Chained/Makefile,v 1.2 2007/08/31 13:37:07 mat Exp $
# $MidnightBSD$
#

PORTNAME=	Class-Accessor-Chained
PORTVERSION=	0.01
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	make chained accessors
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Class/Accessor.pm:${PORTSDIR}/devel/p5-Class-Accessor
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_MODBUILD=	yes

MAN3=		Class::Accessor::Chained.3 \
		Class::Accessor::Chained::Fast.3

.include <bsd.port.mk>
