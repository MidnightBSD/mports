# $MidnightBSD: mports/x11-toolkits/libgdiplus/Makefile,v 1.10 2012/03/11 18:41:52 laffer1 Exp $

PORTNAME=	libgdiplus
PORTVERSION=	2.10
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://ftp.novell.com/pub/mono/sources/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GDI+ API for System.Windows.Forms in Mono
LICENSE=	mit

LIB_DEPENDS=	tiff.4:${PORTSDIR}/graphics/tiff \
		gif.5:${PORTSDIR}/graphics/giflib \
		png15:${PORTSDIR}/graphics/png \
		cairo.2:${PORTSDIR}/graphics/cairo

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GNOME=	gnomehack glib20
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_XORG=	x11
CPPFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/libpng15
LDFLAGS+=	-L${LOCALBASE}/lib

.include "${.CURDIR}/../../lang/mono/bsd.mono.mk"
.include <bsd.port.mk>
