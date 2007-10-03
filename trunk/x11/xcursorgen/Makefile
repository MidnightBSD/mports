# New ports collection makefile for:	xcursorgen
# Date Created:				17 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/xcursorgen/Makefile,v 1.2 2007/09/13 19:45:02 flz Exp $
# $MidnightBSD$
#

PORTNAME=	xcursorgen
PORTVERSION=	1.0.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create an X cursor file from a collection of PNG images
LICENSE=	x11

LIB_DEPENDS=	png.5:${PORTSDIR}/graphics/png

XORG_CAT=	app
USE_XORG=	x11 xcursor

PLIST_FILES=	bin/xcursorgen

MAN1=		xcursorgen.1

.include <bsd.port.mk>
