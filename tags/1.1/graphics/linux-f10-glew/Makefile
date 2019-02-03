# $MidnightBSD$
# $FreeBSD: ports/graphics/linux-f10-glew/Makefile,v 1.3 2010/12/30 13:07:15 flz Exp $

PORTNAME=	glew
PORTVERSION=	1.5.1
PORTREVISION=	2
CATEGORIES=	graphics linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenGL Extension Wrangler Library (Linux Fedora 10)
LICENSE=	bsd3

USE_LINUX=	f10
USE_LINUX_RPM=	yes
LINUX_NAME=	glew

RPMVERSION=	1.fc10
USE_LDCONFIG=	yes
BRANDELF_DIRS=	usr/bin

PLIST_FILES=	usr/bin/glewinfo usr/bin/visualinfo \
		usr/lib/libGLEW.so.1.5 usr/lib/libGLEW.so.1.5.1
DOCSDIR=	${PREFIX}/usr/share/doc/${PORTNAME}-${PORTVERSION}
PORTDOCS=	LICENSE.txt

.include <bsd.port.mk>
