# New ports collection makefile for:	libdrm
# Date created:				29 Dec 2005
# Whom:					lesi@FreeBSD.org
#
# $MidnightBSD: mports/graphics/libdrm/Makefile,v 1.1.1.1 2006/09/17 03:34:00 archite Exp $
# $FreeBSD: ports/graphics/libdrm/Makefile,v 1.7 2006/06/29 13:55:57 anholt Exp $
#

PORTNAME=	libdrm
PORTVERSION=	2.0.2
CATEGORIES=	graphics x11
MASTER_SITES=	http://dri.freedesktop.org/libdrm/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Userspace interface to kernel Direct Rendering Module services

GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes

pre-patch:
	${REINPLACE_CMD} 's|{libdir}/pkgconfig|{prefix}/libdata/pkgconfig|g' \
	    ${WRKSRC}/configure

.include <bsd.port.mk>
