# $MidnightBSD$
# $FreeBSD: ports/www/p5-HTTP-Daemon/Makefile,v 1.2 2011/04/19 17:50:24 culot Exp $

PORTNAME=	HTTP-Daemon
PORTVERSION=	6.00
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple HTTP server class
LICENSE=	perl

RUN_DEPENDS=	p5-HTTP-Date>=6:${PORTSDIR}/www/p5-HTTP-Date \
		p5-HTTP-Message>=6:${PORTSDIR}/www/p5-HTTP-Message \
		p5-LWP-MediaTypes>=6:${PORTSDIR}/www/p5-LWP-MediaTypes
BUILD_DEPENDS:=	${RUN_DEPENDS}

CONFLICTS=	p5-libwww-5*

PERL_CONFIGURE=	yes

MAN3=		HTTP::Daemon.3

.include <bsd.port.mk>
