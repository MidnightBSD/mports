# $MidnightBSD$
# $FreeBSD: ports/net/p5-Socket6/Makefile,v 1.15 2006/06/13 16:17:15 ume Exp $

PORTNAME=	Socket6
PORTVERSION=	0.28
PORTREVISION=	2
CATEGORIES=	net perl5 ipv6
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IPv6 related part of the C socket.h defines and structure manipulators

LICENSE=	bsd3

USES=		perl5
USE_PERL5=	configure

PLIST_FILES=	%%PERL5_MAN3%%/Socket6.3.gz \
		%%SITE_PERL%%/%%PERL_ARCH%%/Socket6.pm \
		%%SITE_PERL%%/%%PERL_ARCH%%/auto/Socket6/Socket6.so
PLIST_DIRS=	%%SITE_PERL%%/%%PERL_ARCH%%/auto/Socket6

.include <bsd.port.mk>
