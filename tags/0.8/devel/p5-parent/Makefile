# $MidnightBSD$
# $FreeBSD: ports/devel/p5-parent/Makefile,v 1.8 2011/05/06 14:15:40 rafan Exp $

PORTNAME=	parent
PORTVERSION=	0.225
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:CORION
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Establish an ISA relationship with base classes at compile time
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		parent.3

regression-test:
	cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.mk>
