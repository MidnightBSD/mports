# New ports collection makefile for:	xf86-input-magictouch
# Date Created:				17 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11-drivers/xf86-input-magictouch/Makefile,v 1.1 2007/05/19 20:28:41 flz Exp $
# $MidnightBSD: mports/x11-drivers/xf86-input-magictouch/Makefile,v 1.1 2007/10/12 03:56:22 ctriv Exp $
#

PORTNAME=	xf86-input-magictouch
PORTVERSION=	1.0.0.5
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org magictouch input driver
LICENSE=	unknown

XORG_CAT=	driver
MAN4=		magictouch.4x
USE_AUTOTOOLS=	libtool:15

BROKEN=		missing header files not found in recent X versions.

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

.include <bsd.port.mk>
