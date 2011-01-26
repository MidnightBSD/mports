# $MidnightBSD: mports/emulators/yabause/Makefile,v 1.4 2008/10/21 22:45:23 ctriv Exp $

PORTNAME=	yabause
PORTVERSION=	0.9.4
CATEGORIES=	emulators
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sega Saturn system emulator
LICENSE=	gpl2

LIB_DEPENDS=	gtkglext-x11-1.0.0:${PORTSDIR}/x11-toolkits/gtkglext

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_SDL=	yes
USE_AUTOTOOLS=	automake:19 aclocal:19 autoconf:261
USE_XLIB=	yes

CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

SUB_FILES=	pkg-message
MAN1=	yabause.1

.include <bsd.port.mk>
