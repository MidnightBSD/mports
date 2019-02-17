# $MidnightBSD$
# $FreeBSD: ports/devel/p5-parent/Makefile,v 1.8 2011/05/06 14:15:40 rafan Exp $

PORTNAME=	parent
PORTVERSION=	0.237
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:CORION
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Establish an ISA relationship with base classes at compile time

LICENSE=	artistic gpl
LICENSE_COMB=	dual

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

regression-test:
	cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.mk>
