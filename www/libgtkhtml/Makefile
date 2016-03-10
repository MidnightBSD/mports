# $MidnightBSD$

PORTNAME=	libgtkhtml
PORTVERSION=	2.11.1
PORTREVISION=	4
CATEGORIES=	www gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight HTML rendering/printing/editing engine

LICENSE=	lgpl

USES=		tar:bzip2 gmake libtool
USE_GNOME=	gnomeprefix libxslt gnomevfs2 
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
