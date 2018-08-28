# Created by: Martin Klaffenboeck <martin.klaffenboeck@gmx.at>
# $MidnightBSD$
# $FreeBSD: head/x11-toolkits/gtkmm30/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gtkmm
PORTVERSION=	3.16.0
PORTREVISION?=	0
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	30
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for Gtk+3

LICENSE=	lgpl2.1

USES+=		tar:xz

.if !defined(REFERENCE_PORT)

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USES+=		gettext gmake libtool pathfix pkgconfig
USE_GNOME=	gtk30 glibmm cairomm atkmm pangomm
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-documentation
INSTALL_TARGET=	install-strip

PLIST_SUB=	API_VERSION="3.0"

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/tests//' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
