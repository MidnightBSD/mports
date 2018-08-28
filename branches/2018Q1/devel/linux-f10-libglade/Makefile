# $MidnightBSD$

PORTNAME=	libglade
PORTVERSION=	0.17
CATEGORIES=	devel linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${PORTNAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of libglade (Linux Fedora 10)

LICENSE=	lgpl

DEPRECATED=	This old version of libglade is no longer supported

CONFLICTS=	linux-libglade-[0-9]*

USE_LINUX=	f10
USE_LINUX_RPM=	yes
RPMVERSION=	21.fc9
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libglade-gnome.so.0 usr/lib/libglade-gnome.so.0.4.2 \
		usr/lib/libglade.so.0 usr/lib/libglade.so.0.4.2
DOCSDIR=	usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	AUTHORS COPYING ChangeLog NEWS README

.include <bsd.port.mk>
