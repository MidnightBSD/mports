PORTNAME=	picom
DISTVERSIONPREFIX=	v
DISTVERSION=	13
CATEGORIES=	x11-wm

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight X11 compositor
WWW=		https://github.com/yshui/picom

LICENSE=	bsd3 mit MPL20
LICENSE_COMB=	multi
LICENSE_FILE_MPL20=	${WRKSRC}/LICENSES/MPL-2.0
LICENSE_FILE_mit=	${WRKSRC}/LICENSES/MIT

BUILD_DEPENDS=	${LOCALBASE}/include/uthash.h:devel/uthash
LIB_DEPENDS=	libconfig.so:devel/libconfig \
		libev.so:devel/libev \
		libxcb-image.so:x11/xcb-util-image \
		libxcb-render-util.so:x11/xcb-util-renderutil \
		libxcb-util.so:x11/xcb-util
RUN_DEPENDS=	xprop:x11/xprop \
		xwininfo:x11/xwininfo

USES=		compiler:c11 desktop-file-utils localbase meson pkgconfig xorg

USE_GITHUB=	yes
GH_ACCOUNT=	yshui

USE_XORG=	pixman x11 xcb xext

MESON_ARGS=	-Dcompton=false -Dgit=false -Dunittest=true
TEST_TARGET=	test

OPTIONS_DEFINE=		DBUS DOCS OPENGL PCRE
OPTIONS_DEFAULT=	DBUS OPENGL PCRE
OPTIONS_SUB=		yes

DBUS_LIB_DEPENDS=	libdbus-1.so:devel/dbus
DBUS_MESON_TRUE=	dbus

DOCS_BUILD_DEPENDS=	asciidoctor:textproc/rubygem-asciidoctor
DOCS_MESON_TRUE=	with_docs

OPENGL_LIB_DEPENDS=	libepoxy.so:graphics/libepoxy
OPENGL_MESON_TRUE=	opengl

PCRE_LIB_DEPENDS=	libpcre2-8.so:devel/pcre2
PCRE_MESON_TRUE=	regex

post-patch:
	@${REINPLACE_CMD} -e 's,/etc,${PREFIX}&,' \
		${WRKSRC}/man/${PORTNAME}.1.adoc \
		${WRKSRC}/src/config.c

post-install:
	${MKDIR} ${PREFIX}/etc/xdg
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.sample.conf \
		${PREFIX}/etc/xdg/${PORTNAME}.conf.sample

.include <bsd.port.mk>
