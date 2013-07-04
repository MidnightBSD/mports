# $MidnightBSD$
# $FreeBSD: ports/devel/linux-f10-dbus-glib/Makefile,v 1.2 2011/03/03 09:26:37 ehaupt Exp $

PORTNAME=	dbus-glib
PORTVERSION=	0.76
CATEGORIES=	devel linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib bindings for D-Bus (Linux Fedora 10)
LICENSE=	gpl2

USE_LINUX_RPM=	yes
USE_LINUX_APPS=	dbuslibs expat
LINUX_DIST_VER=	10
RPMVERSION=	3.fc10
BRANDELF_FILES=	usr/bin/dbus-binding-tool
USE_LDCONFIG=	yes

PLIST_FILES=	usr/bin/dbus-binding-tool usr/lib/libdbus-glib-1.so.2 \
		usr/lib/libdbus-glib-1.so.2.1.0
DOCSDIR=	usr/share/doc/dbus-glib-0.76
PORTDOCS=	COPYING ChangeLog NEWS
DESCR=		${.CURDIR}/../${PORTNAME}/pkg-descr

.include <bsd.port.mk>
