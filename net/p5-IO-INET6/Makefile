# $MidnightBSD: mports/net/p5-IO-INET6/Makefile,v 1.5 2011/05/11 14:14:35 laffer1 Exp $

PORTNAME=	IO-Socket-INET6
PORTVERSION=	2.69
CATEGORIES=	net perl5 ipv6
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	IO
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module with object interface to AF_INET6 domain sockets
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Socket6.pm:${PORTSDIR}/net/p5-Socket6
RUN_DEPENDS=	${BUILD_DEPENDS}

MAN3=		IO::Socket::INET6.3

PERL_CONFIGURE=	yes

.include <bsd.port.mk>

