# New ports collection makefile for:	devel/p5-Class-Accessor-Grouped
# Date created:				Jun 18, 2007
# Whom:					Lars Balker Rasmussen <lbr@FreeBSD.org>
#
# $FreeBSD: ports/devel/p5-Class-Accessor-Grouped/Makefile,v 1.2 2007/07/03 06:03:05 lbr Exp $
# $MidnightBSD$
#

PORTNAME=	Class-Accessor-Grouped
PORTVERSION=	0.07000
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Lets you build groups of accessors
LICENSE=	perl

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-MRO-Compat>=0:${PORTSDIR}/devel/p5-MRO-Compat \
		p5-Class-Inspector>=0:${PORTSDIR}/devel/p5-Class-Inspector

PERL_CONFIGURE=	yes

MAN3=	Class::Accessor::Grouped.3

.include <bsd.port.mk>
