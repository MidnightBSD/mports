# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-ungif/Makefile,v 1.16 2011/03/03 09:26:40 ehaupt Exp $

PORTNAME=	ungif
PORTVERSION=	4.1.3
CATEGORIES=	graphics linux
MASTER_SITES=	CRITICAL/rpm/${LINUX_RPM_ARCH}/fedora/${LINUX_DIST_VER}
PKGNAMEPREFIX=	linux-f10-
DISTNAME=	${LINUX_NAME}-${PORTVERSION}-${RPMVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RPM of gif and ungif libs (Linux Fedora 10)
LICENSE=	mit

CONFLICTS=	linux-ungif-[0-9]*

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_RPM=	yes
LINUX_NAME=	giflib
LINUX_DIST_VER=	10
RPMVERSION=	9
USE_LDCONFIG=	yes

PLIST_FILES=	usr/lib/libgif.so.4 \
		usr/lib/libgif.so.${PORTVERSION} \
		usr/lib/libungif.so.4 \
		usr/lib/libungif.so.${PORTVERSION}
DOCSDIR=	${PREFIX}/usr/share/doc/giflib-${PORTVERSION}
PORTDOCS=	AUTHORS BUGS COPYING ChangeLog NEWS ONEWS README TODO

.include <bsd.port.mk>
