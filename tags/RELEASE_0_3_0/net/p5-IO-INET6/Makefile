# New ports collection makefile for:	p5-IO-INET6
# Date created:		02 July 2003
# Whom:	      		Janos.Mohacsi@bsd.hu
#
# $MidnightBSD: mports/net/p5-IO-INET6/Makefile,v 1.3 2010/01/30 15:26:00 laffer1 Exp $
# $FreeBSD: ports/net/p5-IO-INET6/Makefile,v 1.6 2005/07/30 00:32:52 leeym Exp $
#

PORTNAME=	IO-Socket-INET6
PORTVERSION=	2.61
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

.include <bsd.port.pre.mk>
.if ${PERL_LEVEL} < 500600
EXTRA_PATCHES=	${PATCHDIR}/5.005_03.diff
.endif

.include <bsd.port.post.mk>

