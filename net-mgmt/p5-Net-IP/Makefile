# $MidnightBSD$

PORTNAME=	Net-IP
PORTVERSION=	1.26
PORTREVISION=	1
CATEGORIES=	net-mgmt perl5 ipv6
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for manipulating IPv4/IPv6 addresses

LICENSE=	artistic gpl
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

post-patch:
	@${REINPLACE_CMD} -e 's|my $$count|& = 0|' ${WRKSRC}/ipcount

.include <bsd.port.mk>
