# $MidnightBSD$

PORTNAME=	NetAddr-IP
PORTVERSION=	4.075
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for working with IP addresses and blocks thereof

LICENSE=	perl

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

post-patch:
	${PERL} -ni -e 'print unless /^=head1/../^=cut/' ${WRKSRC}/Lite/Util/Makefile.PL

.include <bsd.port.post.mk>
