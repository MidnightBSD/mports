# New ports collection makefile for:	xcb-proto
# Date Created:				2006-08-23
# Whom:					Ashish Shukla <wahjava@gmail.com>
#
# $FreeBSD: ports/x11/xcb-proto/Makefile,v 1.2 2007/01/28 23:22:19 miwi Exp $
# $MidnightBSD: mports/x11/xcb-proto/Makefile,v 1.1 2007/10/02 21:45:49 ctriv Exp $
#

PORTNAME=	xcb-proto
PORTVERSION=	1.2
CATEGORIES=	x11
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The X protocol C-language Binding (XCB) protocol
LICENSE=	x11

BUILD_DEPENDS=	xmllint:${PORTSDIR}/textproc/libxml2

USE_BZIP2=	yes
USE_GNOME=	gnomehack
USE_PYTHON=	2.5
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0

DATADIR=	${PREFIX}/share/xcb

.include <bsd.port.mk>
