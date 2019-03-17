# $FreeBSD: ports/devel/p5-MRO-Compat/Makefile,v 1.2 2007/07/20 07:26:00 lbr Exp $
# $MidnightBSD$

PORTNAME=	MRO-Compat
PORTVERSION=	0.13
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:HAARG
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Add mro::* interface compatibility for Perls < 5.9.5

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Class-C3>=0.19:devel/p5-Class-C3

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
