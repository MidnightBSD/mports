# $MidnightBSD: mports/x11/xorg-minimal/Makefile,v 1.1 2009/05/08 14:16:15 laffer1 Exp $

PORTNAME=	xorg
PORTVERSION=	7.5.1
CATEGORIES=	x11 x11-servers
MASTER_SITES=	# none
PKGNAMESUFFIX=	-minimal
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org minimal distribution metaport
LICENSE=	agg

NO_BUILD=	yes

RUN_DEPENDS+=	${LOCALBASE}/bin/Xorg:${PORTSDIR}/x11-servers/xorg-server \
		${LOCALBASE}/lib/xorg/modules/drivers/vesa_drv.so:${PORTSDIR}/x11-drivers/xf86-video-vesa \
		${LOCALBASE}/lib/xorg/modules/input/mouse_drv.so:${PORTSDIR}/x11-drivers/xf86-input-mouse \
		${LOCALBASE}/lib/xorg/modules/input/kbd_drv.so:${PORTSDIR}/x11-drivers/xf86-input-keyboard \
		xinit:${PORTSDIR}/x11/xinit \
		xauth:${PORTSDIR}/x11/xauth

do-install:

pre-everything::
	@${ECHO_MSG} "This is a meta-port, meaning that it just depends on its subparts of the port."
	@${ECHO_MSG} "It won't build and install all the parts until you have typed make install"
	@${ECHO_MSG} "This port does not ensure things are upgraded; use portmaster if you want to"
	@${ECHO_MSG} "upgrade X.Org."

.include <bsd.port.mk>
