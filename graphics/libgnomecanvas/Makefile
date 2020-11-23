PORTNAME=	libgnomecanvas
PORTVERSION=	2.30.3
PORTREVISION=	1
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphics library for GNOME

LICENSE=	lgpl

USES+=		tar:bzip2

USES+=		gettext gmake gnome libtool:keepla pathfix pkgconfig
USE_LDCONFIG=	yes
USE_GNOME=	intltool libglade2 libartlgpl2 referencehack
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--enable-glade \
		--disable-gtk-doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
