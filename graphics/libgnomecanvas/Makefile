PORTNAME=	libgnomecanvas
PORTVERSION=	2.30.3
PORTREVISION=	4
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphics library for GNOME

LICENSE=	lgpl

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libharfbuzz.so:print/harfbuzz

USES+=		gettext gmake gnome libtool localbase pathfix pkgconfig tar:bzip2
USE_GNOME=	cairo gdkpixbuf glib20 gtk20 intltool libartlgpl2 pango
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-glade \
		--disable-gtk-doc
INSTALL_TARGET=	install-strip

post-install:
		${RMDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/lib/libglade/2.0
		${RMDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/lib/libglade

.include <bsd.port.mk>
