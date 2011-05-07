# $MidnightBSD: mports/x11/xcb-proto/Makefile,v 1.4 2009/08/20 17:44:53 laffer1 Exp $

PORTNAME=	xcb-proto
PORTVERSION=	1.6
CATEGORIES=	x11 python
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The X protocol C-language Binding (XCB) protocol
LICENSE=	x11

BUILD_DEPENDS=	xmllint:${PORTSDIR}/textproc/libxml2

USE_BZIP2=	yes
USE_GNOME=	gnomehack
USE_PYTHON=	2.5+
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd7.0

DATADIR=	${PREFIX}/share/xcb

.include <bsd.port.mk>
