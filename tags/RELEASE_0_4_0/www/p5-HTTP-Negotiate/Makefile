# $MidnightBSD$
# $FreeBSD: ports/www/p5-HTTP-Negotiate/Makefile,v 1.2 2011/04/19 17:50:24 culot Exp $

PORTNAME=	HTTP-Negotiate
PORTVERSION=	6.00
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the HTTP content negotiation algorithm
LICENSE=	perl

RUN_DEPENDS=	p5-HTTP-Message>=6:${PORTSDIR}/www/p5-HTTP-Message
BUILD_DEPENDS:=	${RUN_DEPENDS}

CONFLICTS=	p5-libwww-5*

PERL_CONFIGURE=	yes

MAN3=		HTTP::Negotiate.3

.include <bsd.port.mk>
