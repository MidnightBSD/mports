PORTNAME=	gstreamer
PORTVERSION=	0.10.36
PORTREVISION=	4
CATEGORIES=	multimedia
MASTER_SITES=	http://gstreamer.freedesktop.org/src/gstreamer/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Development framework for creating media applications

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

CFLAGS:=	${CFLAGS} -O2 -Wno-format
USES=		bison gmake gnome libtool:keepla pathfix pkgconfig tar:bzip2
USE_GNOME=	glib20 introspection libxml2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-tests \
		--disable-examples \
		--disable-failing-tests \
		--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	ac_cv_func_register_printf_function="no"
PLIST_SUB=	VERSION="${GST_VERSION}"
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
GST_VERSION=	0.10

OPTIONS_DEFINE=	LIBCHECK NLS
OPTIONS_SUB=	yes
LIBCHECK_DESC=	Unit tests support

.include <bsd.port.pre.mk>

LIBCHECK_LIB_DEPENDS=	libcheck.so:devel/check
LIBCHECK_CONFIGURE_OFF=	--disable-check

BUILD_DEPENDS+=	${LOCALBASE}/bin/flex:${PORTSDIR}/textproc/flex
CONFIGURE_ENV+=	FLEX_PATH="${LOCALBASE}/bin/flex"

NLS_USES=	gettext
NLS_CONFIGURE_OFF=	--disable-nls

post-patch:
	@${REINPLACE_CMD} -e 's|-Wmissing-include-dirs||g' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
