# $MidnightBSD$
# $FreeBSD: head/graphics/libepoxy/Makefile 385633 2015-05-07 15:17:32Z mat $

PORTNAME=	libepoxy
PORTVERSION=	1.2
DISTVERSIONPREFIX=	v
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to handle OpenGL function pointer management

LICENSE=	mit

USE_GITHUB=	yes
GH_ACCOUNT=	anholt

WRKSRC=		${WRKDIR}/libepoxy-1.2

USES=		autoreconf libtool pathfix pkgconfig python:3,build
USE_XORG=	xorg-macros x11
USE_GL=		egl glesv2
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
PATHFIX_MAKEFILEIN=	Makefile.am

.include <bsd.port.mk>
