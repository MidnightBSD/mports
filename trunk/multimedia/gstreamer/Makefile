# $MidnightBSD$

PORTNAME=	gstreamer
PORTVERSION=	0.10.36
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gstreamer/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Development framework for creating media applications

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

CFLAGS:=	${CFLAGS} -O2 -Wno-format
USES=		bison gettext gmake pathfix pkgconfig
USE_BZIP2=	yes
USE_GNOME=	glib20 introspection libxml2 ltverhack ltasneededhack
USE_AUTOTOOLS=	libtool
CONFIGURE_ARGS=	--disable-tests \
		--disable-examples \
		--disable-failing-tests \
		--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	ac_cv_func_register_printf_function="no"
PLIST_SUB=	VERSION="${GST_VERSION}"
USE_LDCONFIG=	yes
GST_VERSION=	0.10

MAN1=	gst-feedback-${GST_VERSION}.1 gst-inspect-${GST_VERSION}.1 \
	gst-launch-${GST_VERSION}.1 \
	gst-typefind-${GST_VERSION}.1 gst-xmlinspect-${GST_VERSION}.1 \
	gst-xmllaunch-${GST_VERSION}.1

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MLIBCHECK}
LIB_DEPENDS+=	libcheck.so:${PORTSDIR}/devel/libcheck
PLIST_SUB+=	CHECK=""
.else
CONFIGURE_ARGS+=--disable-check
PLIST_SUB+=	CHECK="@comment "
.endif

BUILD_DEPENDS+=	${LOCALBASE}/bin/flex:${PORTSDIR}/textproc/flex
CONFIGURE_ENV+=	FLEX_PATH="${LOCALBASE}/bin/flex"

post-patch:
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
		${WRKSRC}/configure

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/libgst*.so*
	@${STRIP_CMD} ${PREFIX}/lib/gstreamer-0.10/libgst*.so

.include <bsd.port.post.mk>
