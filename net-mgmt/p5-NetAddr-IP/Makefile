# New ports collection makefile for:	p5-NetAddr-IP
# Date created:				12 July 2000
# Whom:					Christopher N. Harrell <cnh@ivmg.net>
#
# $MidnightBSD$
# $FreeBSD: ports/net-mgmt/p5-NetAddr-IP/Makefile,v 1.32 2007/06/17 09:39:48 tobez Exp $
#

PORTNAME=	NetAddr-IP
PORTVERSION=	4.00.7
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	NetAddr
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/.([0-9])$/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for working with IP addresses and blocks thereof

PERL_CONFIGURE=	yes

MAN3=		NetAddr::IP.3 \
	NetAddr::IP::Lite.3 \
	NetAddr::IP::Util.3 \
	NetAddr::IP::UtilPP.3

.include <bsd.port.pre.mk>

post-patch:
	${PERL} -ni -e 'print unless /^=head1/../^=cut/' ${WRKSRC}/Lite/Util/Makefile.PL

.include <bsd.port.post.mk>
