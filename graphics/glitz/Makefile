# $MidnightBSD: mports/graphics/glitz/Makefile,v 1.6 2011/12/15 00:57:47 laffer1 Exp $
# $FreeBSD: ports/graphics/glitz/Makefile,v 1.10 2006/05/07 23:46:04 edwin Exp $

PORTNAME=	glitz
PORTVERSION=	0.5.6
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/snapshots/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL image compositing library
LICENSE=	x11

USE_GL=		yes
USE_XORG=	xt xorg-server
USE_GNOME=	pkgconfig  gnomehack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CONFIGURE_ENV=	CPPFLAGS="${PTHREAD_CFLAGS}" \
		LDFLAGS="${PTHREAD_LIBS}"

.include <bsd.port.mk>

