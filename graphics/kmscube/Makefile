PORTNAME=	kmscube
PORTVERSION=	s20230926
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Example KMS/GBM/EGL application
WWW=		https://gitlab.freedesktop.org/mesa/kmscube

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libdrm.so:graphics/libdrm

USES=		gl meson pkgconfig
USE_GITLAB=	yes
USE_GL=		egl gbm glesv2
GL_SITE=	https://gitlab.freedesktop.org
GL_ACCOUNT=	mesa
GL_TAGNAME=	96d63eb
PLIST_FILES=	bin/${PORTNAME} \
		bin/texturator \
		${NULL}

OPTIONS_DEFINE=	GSTREAMER PNG
OPTIONS_DEFAULT=PNG

GSTREAMER_USES=		gnome gstreamer
GSTREAMER_USE=		GNOME=glib20
GSTREAMER_MESON_ENABLED=gstreamer

PNG_LIB_DEPENDS=	libpng.so:graphics/png

post-patch-PNG-off:
	@${REINPLACE_CMD} 's/dep_libpng.found()/false/' ${WRKSRC}/meson.build

.include <bsd.port.mk>
