# $MidnightBSD: mports/x11-toolkits/libgdiplus/Makefile,v 1.8 2011/12/15 00:57:58 laffer1 Exp $

PORTNAME=	libgdiplus
PORTVERSION=	2.10
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://ftp.novell.com/pub/mono/sources/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GDI+ API for System.Windows.Forms in Mono
LICENSE=	x11

LIB_DEPENDS=	tiff.4:${PORTSDIR}/graphics/tiff \
		ungif.5:${PORTSDIR}/graphics/libungif \
		png.6:${PORTSDIR}/graphics/png

GNU_CONFIGURE=	yes
USE_BZIP2=	yes
USE_GNOME=	gnomehack  glib20
USE_GMAKE=	yes
USE_XLIB=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="${LDFLAGS} -L${LOCALBASE}/lib"

.include "${.CURDIR}/../../lang/mono/bsd.mono.mk"
.include <bsd.port.mk>
