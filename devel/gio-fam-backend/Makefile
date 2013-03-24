# $MidnightBSD: mports/devel/gio-fam-backend/Makefile,v 1.9 2013/03/24 16:55:25 laffer1 Exp $

PORTNAME=	gio-fam-backend
PORTVERSION=	2.34.3
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME:S,%SUBDIR%,sources/glib/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/},} \
		ftp://ftp.gtk.org/pub/glib/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}/ \
		ftp://ftp.gimp.org/pub/%SUBDIR%/ \
		ftp://ftp.cs.umn.edu/pub/gimp/%SUBDIR%/ \
		http://www.ameth.org/gimp/%SUBDIR%/ \
		${MASTER_SITE_RINGSERVER:S,%SUBDIR%,graphics/gimp/%SUBDIR%,}
MASTER_SITE_SUBDIR=	gtk/v${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	glib-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FAM backend for GLib's GIO library
LICENSE=	lgpl

USE_XZ=		yes
BUILD_WRKSRC=	${WRKSRC}/gio/fam
INSTALL_WRKSRC=	${BUILD_WRKSRC}
GNU_CONFIGURE=	yes
USE_PKGCONFIG=	build
USE_GNOME=	gnomehack _glib20
USE_FAM=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
CONFIGURE_ARGS=	--enable-static --with-libiconv=gnu
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lintl

.include <bsd.port.mk>
