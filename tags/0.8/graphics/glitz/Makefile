# $MidnightBSD$
# $FreeBSD: ports/graphics/glitz/Makefile,v 1.10 2006/05/07 23:46:04 edwin Exp $

PORTNAME=	glitz
PORTVERSION=	0.5.6
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/snapshots/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL image compositing library

LICENSE=	mit

USES=		libtool:keepla pathfix pkgconfig
USE_GL=		yes
USE_XORG=	xt xorg-server
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CONFIGURE_ENV=	CPPFLAGS="${PTHREAD_CFLAGS}" \
		LDFLAGS="${PTHREAD_LIBS}"

.include <bsd.port.mk>

