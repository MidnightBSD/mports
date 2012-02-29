# $MidnightBSD: mports/graphics/gdk-pixbuf2/Makefile,v 1.2 2012/02/28 03:26:30 laffer1 Exp $
# $FreeBSD: ports/graphics/gdk-pixbuf2/Makefile,v 1.2 2010/12/04 07:31:56 ade Exp $

PORTNAME=	gdk-pixbuf
PORTVERSION=	2.23.5
CATEGORIES?=	graphics
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gdk-pixbuf/${PORTVERSION:R}
PKGNAMESUFFIX=	2
DISTNAME=	gdk-pixbuf-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A graphic library for GTK+
LICENSE=	gpl2

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	png.6:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		jasper.4:${PORTSDIR}/graphics/jasper

USE_XZ=		yes
USE_GMAKE=	yes
USE_XORG=	xt xi x11
USE_AUTOTOOLS=	libtool
USE_GNOME+=	gnomehack glib20 ltverhack
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--enable-introspection=yes --with-libjasper

MAN1=		gdk-pixbuf-csource.1 gdk-pixbuf-query-loaders.1

post-patch:
	@${REINPLACE_CMD} -e 's|" == "|" = "|g' ${WRKSRC}/configure

post-install:
	@cd ${WRKSRC}/docs/reference/gdk-pixbuf && gmake ${FAKE_MAKEARGS} install-man1

.include <bsd.port.mk>
