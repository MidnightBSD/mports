PORTNAME=	gstreamer1-editing-services
PORTVERSION=	${_GST_VERSION}
CATEGORIES=	multimedia
MASTER_SITES=	https://gstreamer.freedesktop.org/src/gstreamer-editing-services/
DISTNAME=	gst-editing-services-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GStreamer editing services
WWW=		http://gstreamer.freedeskop.org

LICENSE=	lgpl

USES=		bison compiler:c11 gnome gstreamer meson ninja python pkgconfig tar:xz
USE_GNOME=	glib20 introspection:build libxml2 pygobject3:build
USE_GSTREAMER=	bad good
USE_LDCONFIG=	yes

MESON_ARGS=	-Ddoc=disabled \
		-Dtests=disabled \
		-Dvalidate=disabled \
		-Dpygi-overrides-dir=${PYTHON_SITELIBDIR}/gstreamer-editing-services

BINARY_ALIAS=	python3=${PYTHON_VERSION}
PORTSCOUT=	limitw:1,even

PLIST_SUB=	SOVERSION="${_GST_SOVERSION}" \
		VERSION="${_GST_LIB_VER}"

OPTIONS_DEFINE=	BASH
OPTIONS_DEFAULT=BASH
OPTIONS_SUB=	yes

BASH_BUILD_DEPENDS=	bash-completion>0:shells/bash-completion
BASH_MESON_ENABLED=	bash-completion

NO_TEST=	yes

post-install:
	${MKDIR} ${PREFIX}/share/bash-completion/completions
	${INSTALL_SCRIPT} ${WRKSRC}/data/completions/ges-launch-1.0 \
	${PREFIX}/share/bash-completion/completions/

.include <bsd.port.mk>
