# $MidnightBSD: mports/x11/xcb-proto/Makefile,v 1.6 2013/02/23 15:32:06 laffer1 Exp $

PORTNAME=	xcb-proto
PORTVERSION=	1.8
CATEGORIES=	x11 python
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The X protocol C-language Binding (XCB) protocol
LICENSE=	mit

BUILD_DEPENDS=	xmllint:${PORTSDIR}/textproc/libxml2

USE_BZIP2=	yes
USE_PATHFIX=	yes
USE_PYTHON=	2.5+
GNU_CONFIGURE=	yes

DATADIR=	${PREFIX}/share/xcb

.include <bsd.port.mk>
