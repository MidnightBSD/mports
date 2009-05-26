# $MidnightBSD$

PORTNAME=	pangomm
PORTVERSION=	2.14.1
PORTREVISION?=	0
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ wrapper for Pango
LICENSE=	gpl2

USE_BZIP2=	yes

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	glibmm-2.4.1:${PORTSDIR}/devel/glibmm \
		cairomm-1.0.1:${PORTSDIR}/graphics/cairomm
BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pango
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--disable-demos \
		--disable-docs \
		--disable-examples \
		--enable-static=yes \
		--with-sigc-prefix=${LOCALBASE}

PLIST_SUB=	VERSION="2.4" API_VERSION="1.4"

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/tests//' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
