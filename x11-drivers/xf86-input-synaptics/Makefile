# $MidnightBSD: mports/x11-drivers/xf86-input-synaptics/Makefile,v 1.1 2009/05/21 15:58:19 laffer1 Exp $

PORTNAME=	xf86-input-synaptics
PORTVERSION=	1.2.1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org synaptics input driver
LICENSE=	x11

CONFLICTS=	synaptics-[0-9]*

USE_GNOME=	gnomehack
USE_XORG=	x11
XORG_CAT=	driver

MAN1=		syndaemon.1 \
		synclient.1
MAN4=		synaptics.4x

post-install:
	${MKDIR} ${PREFIX}/share/hal/fdi/policy/10osvendor
	${INSTALL_DATA} ${WRKSRC}/fdi/11-x11-synaptics.fdi \
		${PREFIX}/share/hal/fdi/policy/10osvendor/

.include <bsd.port.mk>
