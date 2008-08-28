# New ports collection makefile for:	liboobs
# Date created:		2006-06-06
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/liboobs/Makefile,v 1.6 2008/06/06 13:21:28 edwin Exp $
#   $MCom: ports/devel/liboobs/Makefile,v 1.35 2008/03/09 18:52:59 mezz Exp $
#

PORTNAME=	liboobs
PORTVERSION=	2.22.0
PORTREVISION=	0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	portsMidnightBSD.org
COMMENT=	Wrapping library to the System Tools Backends
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/etc/dbus-1/system.d/system-tools-backends.conf:${PORTSDIR}/sysutils/system-tools-backends
LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib \
    		hal.1:${PORTSDIR}/sysutils/hal
RUN_DEPENDS=	${LOCALBASE}/etc/dbus-1/system.d/system-tools-backends.conf:${PORTSDIR}/sysutils/system-tools-backends

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gnomehack glib20
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include"

.include <bsd.port.mk>
