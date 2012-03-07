# $MidnightBSD$
# $FreeBSD: ports/graphics/clutter/Makefile,v 1.17 2011/09/23 22:23:05 amdmi3 Exp $

PORTNAME=	clutter
PORTVERSION=	1.4.0
CATEGORIES=	graphics
MASTER_SITES=	GNOME \
		http://source.clutter-project.org/sources/${PORTNAME}/${PORTVERSION:R}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL based interactive canvas library
LICENSE=	lgpl

LIB_DEPENDS=	json-glib-1.0.0:${PORTSDIR}/devel/json-glib

USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	pkgconfig gdkpixbuf2 gnomehack ltverhack gnomeprefix atk pango
USE_GL=		gl
USE_XORG=	glproto x11 xfixes xdamage xcomposite xi
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-x --enable-conformance=no

CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

.include <bsd.port.mk>
