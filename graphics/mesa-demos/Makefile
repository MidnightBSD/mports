PORTNAME=	mesa-demos
PORTVERSION=	8.5.0
CATEGORIES=	graphics
MASTER_SITES=	https://mesa.freedesktop.org/archive/demos/${PORTVERSION}/ \
		ftp://ftp.freedesktop.org/pub/mesa/demos/ #${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL demos distributed with Mesa
WWW=		https://www.mesa3d.org/

LICENSE=	mit

CONFLICTS_INSTALL=	glx-utils

USES=		gl localbase meson pkgconfig tar:bzip2 xorg
USE_GL=		egl gl glesv2 glu glut
USE_XORG=	xorgproto x11 xdamage xext xfixes xi xxf86vm

MESON_ARGS+=	-Dwith-glut=${LOCALBASE} \
		-Dgles1=disabled \
		-Dlibdrm=disabled \
		-Dosmesa=disabled \
		-Dwayland=disabled \
		-Dwith-system-data-files=true

.include <bsd.mport.options.mk>


CFLAGS+=	-Wno-error=incompatible-function-pointer-types


post-fake:
	# bitmap program conflicts with x11/bitmap
	${MV} ${FAKE_DESTDIR}/${TRUE_PREFIX}/bin/bitmap ${FAKE_DESTDIR}/${TRUE_PREFIX}/bin/bitmap_demo

.include <bsd.port.mk>
