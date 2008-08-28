# New ports collection makefile for:	gpac-libm4systems
# Date created:		2005-05-04
# Whom:			Michael Johnson <ahze@FreeBSD.org>
#
# $MidnightBSD: mports/multimedia/gpac-libgpac/Makefile,v 1.3 2007/11/12 01:14:41 laffer1 Exp $
# $FreeBSD: ports/multimedia/gpac-libgpac/Makefile,v 1.13 2006/08/14 23:36:33 ahze Exp $
#

PORTNAME=	gpac-libgpac
DISTVERSION=	0.4.4
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	gpac
DISTNAME=	gpac-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gpac MPEG-4 Systems library and headers
LICENSE=	lgpl

WRKSRC=		${WRKDIR}/gpac
ALL_TARGET=	lib
USE_GCPIO=	yes
USE_GMAKE=	yes
HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes

BUILD_WRKSRC=	${WRKSRC}/src
INSTALL_WRKSRC=	${WRKSRC}/bin/gcc
LIBVER=	1

CONFIGURE_ARGS=	--cc="${CC}" \
		--extra-cflags="${CFLAGS} ${PTHREAD_CFLAGS} -fPIC" \
		--extra-ldflags="${LDFLAGS} ${PTHREAD_LIBS}"

.include <bsd.port.pre.mk>

post-patch:
	${CHMOD} +x ${WRKSRC}/configure

do-install:
	${MKDIR} ${PREFIX}/include/gpac
	cd ${WRKSRC}/include/gpac && ${FIND} . | \
		${CPIO} -vpdm -L -R ${LIBOWN}:${LIBGRP} ${PREFIX}/include/gpac
	${INSTALL_DATA} ${INSTALL_WRKSRC}/libgpac.so.${LIBVER} ${PREFIX}/lib
	${LN} -sf libgpac.so.${LIBVER} ${PREFIX}/lib/libgpac.so
	${INSTALL_DATA} ${INSTALL_WRKSRC}/libgpac_static.a ${PREFIX}/lib

.include <bsd.port.post.mk>
