PORTNAME=	x2vnc
PORTVERSION=	1.7.2
PORTEPOCH=	1
CATEGORIES=	x11-servers
MASTER_SITES=	http://fredrik.hubbe.net/x2vnc/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program to link multiple X and VNC servers together
WWW=		https://fredrik.hubbe.net/x2vnc.html

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

USES=		xorg
USE_XORG=	x11 xext xrandr xxf86dga ice xinerama xrandr xrender xscrnsaver sm

PLIST_FILES=	bin/x2vnc \
		share/man/man1/x2vnc.1.gz

.include <bsd.port.mk>
