# $MidnightBSD$

PORTNAME=	libgtkhtml
PORTVERSION=	2.11.1
PORTREVISION=	7
CATEGORIES=	www gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight HTML rendering/printing/editing engine

LICENSE=	lgpl

USES=		gmake libtool:keepla pathfix pkgconfig tar:bzip2
USE_GNOME=	gnomeprefix libxslt gnomevfs2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
