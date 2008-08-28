# New ports collection makefile for:	www/p5-CGI-Ajax
# Date created:				19 September 2005
# Whom:					Lars Thegler <lth@FreeBSD.org>
#
# $FreeBSD: ports/www/p5-CGI-Ajax/Makefile,v 1.21 2007/02/01 21:37:07 lth Exp $
# $MidnightBSD: mports/www/p5-CGI-Ajax/Makefile,v 1.1 2007/11/02 21:52:25 ctriv Exp $
#

PORTNAME=	CGI-Ajax
PORTVERSION=	0.703
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CGI
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/0$//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A module for writing AJAX/DHTML-based web apps
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Class/Accessor.pm:${PORTSDIR}/devel/p5-Class-Accessor
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	CGI::Ajax.3

.include <bsd.port.mk>
