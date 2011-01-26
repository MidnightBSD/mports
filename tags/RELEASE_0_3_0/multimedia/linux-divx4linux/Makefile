# New ports collection makefile for:	divx4linux
# Date created:				Mon Sep 24 15:40:14 BRT 2001
# Whom:			Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/multimedia/linux-divx4linux/Makefile,v 1.19 2007/04/01 07:50:28 lioux Exp $
#

PORTNAME=	divx4linux
PORTVERSION=	5.0.${RELEASE_DATE}
PORTREVISION=	3
CATEGORIES=	multimedia linux
MASTER_SITES=	http://download.divx.com/divx/
PKGNAMEPREFIX=	linux-
DISTNAME=	${PORTNAME}-std-${RELEASE_DATE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux binary release of DivX (TM) Codec
LICENSE=	restricted

RESTRICTED=	unsure of licensing issues

ONLY_FOR_ARCHS=	i386 amd64
USE_LINUX_PREFIX=	yes
USE_LINUX=	yes
WRKSRC=	${WRKDIR}/${PORTNAME}-${RELEASE_DATE}
NO_BUILD=	yes
PLIST_SUB=	PKGNAME="${PKGNAME}"

DOC_EXT=	htm
RELEASE_DATE=	20030428

post-patch:
.for ext in ${DOC_EXT}
	@${REINPLACE_CMD} -e "s///" ${WRKSRC}/*.${ext}
.endfor

do-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${PREFIX}/usr/share/doc/${PKGNAME}
.for ext in ${DOC_EXT}
	@${INSTALL_DATA} ${WRKSRC}/*.${ext} ${PREFIX}/usr/share/doc/${PKGNAME}
.endfor
.endif
# Header file installation
	@${MKDIR} ${PREFIX}/usr/include/divx
	@${INSTALL_DATA} ${WRKSRC}/*.h ${PREFIX}/usr/include/divx
# Library installation
	@${INSTALL_DATA} ${WRKSRC}/*.so ${PREFIX}/usr/lib
	( cd ${PREFIX}/usr/lib; ${LN} -s libdivxencore.so libdivxencore.so.0 )
	( cd ${PREFIX}/usr/lib; ${LN} -s libdivxdecore.so libdivxdecore.so.0 )

.include <bsd.port.mk>
