PORTNAME=	libportal
PORTVERSION=	0.10.0
PORTREVISION=	0
CATEGORIES=	deskutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	GIO-styled async APIs for Flatpak
WWW=		https://github.com/flatpak/libportal

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gtkdoc-scan:textproc/gtk-doc
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-dbusmock>0:devel/py-python-dbusmock@${PY_FLAVOR}

USES+=		gnome meson pkgconfig python:3.11+,test

USE_GNOME+=	glib20 introspection:build
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	flatpak

OPTIONS_DEFINE=		VAPI
OPTIONS_DEFAULT=	VAPI

VAPI_MESON_TRUE=	vapi
VAPI_USES=		vala:build

MESON_ARGS=	-Ddocs=false \
		-Dbackend-gtk3=disabled -Dbackend-gtk4=disabled \
		-Dbackend-qt5=disabled -Dbackend-qt6=disabled
OPTIONS_SUB=	yes

.if defined(BACKEND)
LIB_DEPENDS=	libportal.so:deskutils/libportal
PLIST=		${PKGDIR}/pkg-plist.${BACKEND}
MESON_ARGS+=	-Dbackend-${BACKEND}=enabled

post-install:
	@cd ${PREFIX} && \
		${CAT} ${PKGDIR}/pkg-plist | ${SED} -e 's/^%%VAPI%%//' | ${XARGS} ${RM}
	@${FIND} ${PREFIX} -type d -empty -delete
.endif

.include <bsd.port.mk>
