PORTNAME=	libadwaita
PORTVERSION=	0.0.20210812
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Building blocks for modern GNOME applications

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	sassc:textproc/sassc \
		valac:lang/vala \
		vulkan-headers>0:graphics/vulkan-headers
LIB_DEPENDS=	libfribidi.so:converters/fribidi \
		libgraphene-1.0.so:graphics/graphene \
		libvulkan.so:graphics/vulkan-loader

USES=		gettext gnome meson ninja pkgconfig
USE_GITLAB=	yes
USE_GNOME=	cairo gdkpixbuf2 gtk40 introspection:build
GL_SITE=	https://gitlab.gnome.org
GL_ACCOUNT=	GNOME
GL_COMMIT=	8442d6097b36c17e87582525ceab3ce3d5bccd48

PORTSCOUT=	limit:1,even

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	gi-docgen:textproc/py-gi-docgen
DOCS_MESON_TRUE=	gtk_doc

WRKSRC=		${WRKDIR}/libadwaita-8442d6097b36c17e87582525ceab3ce3d5bccd48

.include <bsd.port.mk>