# $MidnightBSD: mports/net-mgmt/p5-NetAddr-IP/Makefile,v 1.3 2012/02/03 03:18:22 laffer1 Exp $

PORTNAME=	NetAddr-IP
PORTVERSION=	4.066
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for working with IP addresses and blocks thereof
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		NetAddr::IP.3 \
	NetAddr::IP::InetBase.3 \
	NetAddr::IP::Lite.3 \
	NetAddr::IP::Util.3 \
	NetAddr::IP::UtilPP.3

.include <bsd.port.pre.mk>

post-patch:
	${PERL} -ni -e 'print unless /^=head1/../^=cut/' ${WRKSRC}/Lite/Util/Makefile.PL

.include <bsd.port.post.mk>
