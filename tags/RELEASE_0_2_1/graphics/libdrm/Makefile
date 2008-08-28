# New ports collection makefile for:    libdrm
# Date created:                         29 Dec 2005
# Whom:                                 lesi@FreeBSD.org
#
# $FreeBSD: ports/graphics/libdrm/Makefile,v 1.8 2007/05/19 20:09:46 flz Exp $
# $MidnightBSD$
#

PORTNAME=       libdrm
PORTVERSION=    2.3.0
CATEGORIES=     graphics x11
MASTER_SITES=   http://dri.freedesktop.org/libdrm/

MAINTAINER=     ports@MidnightBSD.org
COMMENT=        Userspace interface to kernel Direct Rendering Module services
LICENSE=        x11

GNU_CONFIGURE=  yes
USE_LDCONFIG=   yes

pre-patch:
	@${REINPLACE_CMD} 's|{libdir}/pkgconfig|{prefix}/libdata/pkgconfig|g' \
		${WRKSRC}/configure
                    
.include <bsd.port.mk>

