PORTNAME=	gtkmm
PORTVERSION=	2.24.5
PORTREVISION?=	2
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	24
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for Gtk+
WWW=		https://www.gtkmm.org/

LICENSE=	lgpl

USES+=		tar:xz

PORTSCOUT=	ignore:1

BUILD_DEPENDS=	gm4:devel/m4
LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig

GNU_CONFIGURE=	yes
USES+=		gettext gmake gnome libtool:keepla pathfix pkgconfig \
		compiler:c++11-lang
USE_CXXSTD=	gnu++11
USE_LDCONFIG=	yes
USE_GNOME=	atkmm gdkpixbuf gtk20 pangomm
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-documentation
INSTALL_TARGET=	install-strip
BINARY_WRAPPERS=	gm4

PLIST_SUB=	VERSION="2.4" API_VERSION="2.4"

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/tests//' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
