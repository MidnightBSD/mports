# $MidnightBSD: mports/graphics/libdrm/Makefile,v 1.6 2009/05/31 22:38:40 laffer1 Exp $

PORTNAME=	libdrm
PORTVERSION=	2.4.11
CATEGORIES=	graphics x11
MASTER_SITES=	http://dri.freedesktop.org/libdrm/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Userspace interface to kernel Direct Rendering Module services
LICENSE=	x11

BUILD_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:${PORTSDIR}/devel/libpthread-stubs
RUN_DEPENDS+=	${LOCALBASE}/libdata/pkgconfig/pthread-stubs.pc:${PORTSDIR}/devel/libpthread-stubs

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes
CONFIGURE_ARGS=	--enable-nouveau-experimental-api

pre-patch:
	@${REINPLACE_CMD} 's|{libdir}/pkgconfig|{prefix}/libdata/pkgconfig|g' \
	    ${WRKSRC}/configure

.include <bsd.port.mk>
