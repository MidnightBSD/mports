# New ports collection makefile for:	libtelepathy
# Date created:				Apr 16 2007
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $MidnightBSD: mports/net-im/libtelepathy/Makefile,v 1.1 2008/09/13 22:26:49 laffer1 Exp $
# $FreeBSD: ports/net-im/libtelepathy/Makefile,v 1.9 2008/06/06 13:51:47 edwin Exp $

PORTNAME=	libtelepathy
PORTVERSION=	0.3.3
CATEGORIES=	net-im devel
MASTER_SITES=	http://telepathy.freedesktop.org/releases/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flexible Communications Framework
LICENSE=	lgpl

LIB_PC_DEPENDS=	dbus-glib-1.pc:${PORTSDIR}/devel/dbus-glib

BUILD_DEPENDS=	xsltproc:${PORTSDIR}/textproc/libxslt
LIB_DEPENDS=	telepathy-glib.0:${PORTSDIR}/net-im/telepathy-glib

BUILD_DEPENDS+=	${LIB_PC_DEPENDS:C|^|${LOCALBASE}/libdata/pkgconfig/|g}
RUN_DEPENDS+=	${LIB_PC_DEPENDS:C|^|${LOCALBASE}/libdata/pkgconfig/|g}

USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pkgconfig glib20 ltverhack gnometarget
USE_AUTOTOOLS=	libtool:22

.include <bsd.port.mk>
