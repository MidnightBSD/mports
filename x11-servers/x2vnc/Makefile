# $MidnightBSD: mports/x11-servers/x2vnc/Makefile,v 1.4 2008/08/20 18:53:38 laffer1 Exp $

PORTNAME=	x2vnc
PORTVERSION=	1.72
PORTREVISION=	2
CATEGORIES=	x11-servers
MASTER_SITES=	http://fredrik.hubbe.net/x2vnc/
DISTNAME=	${PORTNAME}-1.7.2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program to link multiple X and VNC servers together
LICENSE=	gpl2

USE_XORG=	x11 xext xrandr xxf86dga ice xinerama xrandr xrender xscrnsaver sm
USE_GNOME=	gnometarget
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		x2vnc.1
PLIST_FILES=	bin/x2vnc

.include <bsd.port.mk>
