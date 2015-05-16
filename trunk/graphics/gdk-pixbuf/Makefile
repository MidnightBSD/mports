# $MidnightBSD$

PORTNAME?=	gdk-pixbuf
PORTVERSION=	0.22.0
PORTREVISION=	7
CATEGORIES?=	graphics
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gdk-pixbuf/0.22
DISTNAME=	gdk-pixbuf-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Graphic library for GTK+

LICENSE=	gpl2

LIB_DEPENDS+=	libpng.so:${PORTSDIR}/graphics/png \
		libtiff.so:${PORTSDIR}/graphics/tiff \
		libjpeg.so:${PORTSDIR}/graphics/jpeg

USES=		gmake libtool pathfix tar:bzip2
USE_XORG=	xt xi x11
USE_GNOME+=	gtk12
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc --enable-shared=yes
CONFIGURE_ENV+=	LIBS="-L${LOCALBASE}/lib" \
		BUILD_CANVAS="${BUILD_CANVAS}"
CPPFLAGS+=	-I${LOCALBASE}/include

BUILD_CANVAS?=	no

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|' \
		-e 's/freebsd/freebsd*|midnightbsd/' \
		 ${WRKSRC}/configure

.include <bsd.port.mk>
