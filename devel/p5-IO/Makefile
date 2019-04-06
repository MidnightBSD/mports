# $MidnightBSD$
# $FreeBSD: ports/devel/p5-IO/Makefile,v 1.7 2007/09/18 11:11:54 skv Exp $

PORTNAME=	IO
PORTVERSION=	1.2301
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Various IO modules for Perl

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure
CONFIGURE_ARGS=	INSTALLDIRS=site POLLUTE=1

NO_TEST=	yes

.include <bsd.port.mk>
