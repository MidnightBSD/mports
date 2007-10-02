# New ports collection makefile for:	xcb-proto
# Date Created:				2006-08-23
# Whom:					Ashish Shukla <wahjava@gmail.com>
#
# $FreeBSD: ports/x11/xcb-proto/Makefile,v 1.2 2007/01/28 23:22:19 miwi Exp $
# $MidnightBSD$
#

PORTNAME=	xcb-proto
PORTVERSION=	1.0
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The X protocol C-language Binding (XCB) protocol
LICENSE=	x11

BUILD_DEPENDS=	xmllint:${PORTSDIR}/textproc/libxml2

PREFIX?=	${X11BASE}
USE_BZIP2=	yes
USE_GNOME=	gnomehack
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd${OSREL}

DATADIR=	${PREFIX}/share/xcb

.include <bsd.port.mk>
