# $MidnightBSD$
# $FreeBSD: ports/net/p5-Net-HTTP/Makefile,v 1.5 2011/11/28 12:52:49 culot Exp $

PORTNAME=	Net-HTTP
PORTVERSION=	6.02
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level HTTP client
LICENSE=	perl

RUN_DEPENDS=	p5-Compress-Raw-Zlib>=0:${PORTSDIR}/archivers/p5-Compress-Raw-Zlib \
		p5-IO-Compress>=0:${PORTSDIR}/archivers/p5-IO-Compress \
		p5-IO-Socket-SSL>=1.38:${PORTSDIR}/security/p5-IO-Socket-SSL
BUILD_DEPENDS:=	${RUN_DEPENDS}

CONFLICTS=	p5-libwww-5*

MAN3=		Net::HTTP.3 \
		Net::HTTPS.3 \
		Net::HTTP::NB.3

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
