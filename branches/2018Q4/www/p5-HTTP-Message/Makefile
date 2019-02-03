# $MidnightBSD$
# $FreeBSD: ports/www/p5-HTTP-Message/Makefile,v 1.2 2011/04/19 17:50:24 culot Exp $

PORTNAME=	HTTP-Message
PORTVERSION=	6.11
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Representation of HTTP style messages

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Encode-Locale>=1:${PORTSDIR}/converters/p5-Encode-Locale \
		p5-HTTP-Date>=6:${PORTSDIR}/www/p5-HTTP-Date \
		p5-IO-HTML>=0:${PORTSDIR}/devel/p5-IO-HTML \
		p5-LWP-MediaTypes>=6:${PORTSDIR}/www/p5-LWP-MediaTypes \
		p5-URI>=1.10:${PORTSDIR}/net/p5-URI
RUN_DEPENDS:=	${BUILD_DEPENDS}

NO_ARCH=	yes
USES=		perl5
PERL_CONFIGURE=	yes

post-patch:
	@${RM} ${WRKSRC}/lib/HTTP/Headers.pm.orig

.include <bsd.port.mk>
