PORTNAME=	libfprint
DISTVERSIONPREFIX=	v
DISTVERSION=	1.94.8
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for fingerprint reader devices
WWW=		https://fprint.freedesktop.org/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgusb.so:devel/libgusb \
		libnss3.so:security/nss \
		libpixman-1.so:x11/pixman

USES=		gnome libtool meson pkgconfig python:env shebangfix
USE_GITLAB=	yes
GL_SITE=	https://gitlab.freedesktop.org
USE_GNOME=	glib20
USE_LDCONFIG=	yes
SHEBANG_GLOB=	*.py
MESON_ARGS=	-Dinstalled-tests=false \
		-Dudev_hwdb=disabled \
		-Dudev_rules=disabled

INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=		DOCS GIR GTK_EXAMPLES
OPTIONS_SUB=		yes
GIR_DESC=		Install glib introspection support
GTK_EXAMPLES_DESC=	Install GTK examples

DOCS_BUILD_DEPENDS=		gtkdoc-scan:textproc/gtk-doc
DOCS_MESON_TRUE=		doc
GIR_MESON_TRUE=			introspection
GTK_EXAMPLES_USE=		GNOME=gtk30
GTK_EXAMPLES_MESON_TRUE=	gtk-examples

NO_TEST=	yes

.include <bsd.port.mk>
