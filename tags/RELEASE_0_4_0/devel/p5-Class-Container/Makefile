# New ports collection makefile for:	Class::Container
# Date created:				5 July 2002
# Whom:					Denis Shaposhnikov <dsh@vlink.ru>
#
# $FreeBSD: ports/devel/p5-Class-Container/Makefile,v 1.10 2007/09/08 00:55:54 linimon Exp $
# $MidnightBSD$
#

PORTNAME=	Class-Container
PORTVERSION=	0.12
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Class
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Glues object frameworks together transparently
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Params/Validate.pm:${PORTSDIR}/devel/p5-Params-Validate
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Class::Container.3

.include <bsd.port.mk>
