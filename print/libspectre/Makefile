# $MidnightBSD$

PORTNAME=	libspectre
PORTVERSION=	0.2.7
CATEGORIES=	print
MASTER_SITES=	http://libspectre.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small library for rendering Postscript documents

LICENSE=	gpl2

USES=		gmake libtool:keepla pathfix pkgconfig
USE_LDCONFIG=	yes
USE_GNOME=	cairo
USE_GHOSTSCRIPT=yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
