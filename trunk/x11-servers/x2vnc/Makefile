# $MidnightBSD$

PORTNAME=	x2vnc
PORTVERSION=	1.7.2
PORTEPOCH=	1
CATEGORIES=	x11-servers
MASTER_SITES=	http://fredrik.hubbe.net/x2vnc/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program to link multiple X and VNC servers together

LICENSE=	gpl2

GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

USE_XORG=	x11 xext xrandr xxf86dga ice xinerama xrandr xrender xscrnsaver sm

PLIST_FILES=	bin/x2vnc \
		man/man1/x2vnc.1.gz

.include <bsd.port.mk>
