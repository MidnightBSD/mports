# $MidnightBSD: mports/x11/xcb-proto/Makefile,v 1.5 2011/05/07 00:26:31 laffer1 Exp $

PORTNAME=	xcb-proto
PORTVERSION=	1.7.1
CATEGORIES=	x11 python
MASTER_SITES=	http://xcb.freedesktop.org/dist/ \
		http://distfiles.pirateparty.in/%SUBDIR%/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	ashish

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The X protocol C-language Binding (XCB) protocol
LICENSE=	mit

BUILD_DEPENDS=	xmllint:${PORTSDIR}/textproc/libxml2

USE_BZIP2=	yes
USE_GNOME=	gnomehack
USE_PYTHON=	2.5+
GNU_CONFIGURE=	yes

DATADIR=	${PREFIX}/share/xcb

.include <bsd.port.mk>
