# $MidnightBSD$

PORTNAME=	XScreenSaver.App
PORTVERSION=	2.3
PORTREVISION=	5
CATEGORIES=	x11 windowmaker
MASTER_SITES=	SF/xscreensaverapp/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WindowMaker dockapp to control XScreenSaver

LICENSE=	gpl2

LIB_DEPENDS=	libdockapp.so:${PORTSDIR}/x11-wm/libdockapp

PLIST_FILES=	bin/XScreenSaver.App
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAKE_ARGS=	"LDFLAGS+=-L${LOCALBASE}/lib -lX11"

.include <bsd.port.mk>
