PORTNAME=	libportal
PORTVERSION=	0.9.1
CATEGORIES=	deskutils

PATCH_SITES=	https://github.com/flatpak/libportal/commit/
PATCHFILES+=	796053d2eebe4532aad6bd3fd80cdf3b197806ec.patch:-p1 # Fix build with Qt >= 6.9.0

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	GIO-styled async APIs for Flatpak
WWW=		https://github.com/flatpak/libportal

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	gtkdoc-scan:textproc/gtk-doc

USES+=		gnome meson pkgconfig

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

NO_TEST=	yes

.if defined(BACKEND)
LIB_DEPENDS=	libportal.so:deskutils/libportal
PLIST=		${PKGDIR}/pkg-plist.${BACKEND}
MESON_ARGS+=	-Dbackend-${BACKEND}=enabled

post-install:
	@cd ${STAGEDIR}${PREFIX} && \
		${CAT} ${PKGDIR}/pkg-plist | ${SED} -e 's/^%%VAPI%%//' | ${XARGS} ${RM}
	@${FIND} ${STAGEDIR}${PREFIX} -type d -empty -delete
.endif

.include <bsd.port.mk>
