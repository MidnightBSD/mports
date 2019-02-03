# $FreeBSD: ports/devel/p5-Class-Trigger/Makefile,v 1.6 2007/03/03 13:23:07 skv Exp $
# $MidnightBSD$

PORTNAME=	Class-Trigger
PORTVERSION=	0.14
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Class
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Mixin to add / call inheritable triggers

LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/Class/Data/Inheritable.pm:${PORTSDIR}/devel/p5-Class-Data-Inheritable \
		${SITE_PERL}/IO/Scalar.pm:${PORTSDIR}/devel/p5-IO-stringy
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
