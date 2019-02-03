# $MidnightBSD$

PORTNAME=	xcb-proto
PORTVERSION=	1.13
CATEGORIES=	x11 python
MASTER_SITES=	http://xcb.freedesktop.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The X protocol C-language Binding (XCB) protocol

LICENSE=	mit

BUILD_DEPENDS=	xmllint:${PORTSDIR}/textproc/libxml2

USES=		python:2 pathfix tar:bzip2
XORG_CAT=	proto
USE_PYTHON=	yes
GNU_CONFIGURE=	yes

DATADIR=	${PREFIX}/share/xcb

.include <bsd.port.mk>
