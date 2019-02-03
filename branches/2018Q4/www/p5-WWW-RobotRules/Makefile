# $MidnightBSD$
# $FreeBSD: ports/www/p5-WWW-RobotRules/Makefile,v 1.2 2011/04/19 17:50:25 culot Exp $

PORTNAME=	WWW-RobotRules
PORTVERSION=	6.02
PORTREVISION=	0
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD>org
COMMENT=	Database of robots.txt-derived permissions
LICENSE=	perl

BUILD_DEPENDS=	p5-URI>=1.10:${PORTSDIR}/net/p5-URI
RUN_DEPENDS:=	${BUILD_DEPENDS}

CONFLICTS=	p5-libwww-5*

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
